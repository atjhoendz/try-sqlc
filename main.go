package main

import (
	"context"
	"database/sql"
	"log"
	"reflect"

	"github.com/atjhoendz/try-sqlc/trysqlc"

	_ "github.com/lib/pq"
)

func run() error {
	ctx := context.Background()

	db, err := sql.Open("postgres", "user=usertry password=pwdpwd dbname=library sslmode=disable")
	if err != nil {
		return err
	}

	queries := trysqlc.New(db)

	// list all books
	books, err := queries.FindAllBooks(ctx)
	if err != nil {
		return err
	}

	log.Println(books)

	// create book
	createdBook, err := queries.CreateBook(ctx, trysqlc.CreateBookParams{
		Title: "Masha",
		Genre: sql.NullString{String: "Comedy", Valid: true},
	})
	if err != nil {
		return err
	}
	log.Println(createdBook)

	// find book by id
	book, err := queries.FindBookByID(ctx, createdBook.ID)
	if err != nil {
		return err
	}
	log.Println(book)

	log.Println(reflect.DeepEqual(book, createdBook))

	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}
