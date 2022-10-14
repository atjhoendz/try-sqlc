-- name: FindBookByID :one
SELECT * FROM "books"
WHERE id = $1 LIMIT 1;

-- name: FindAllBooks :many
SELECT * FROM "books"
ORDER BY title ASC;

-- name: CreateBook :one
INSERT INTO "books" (
  title, genre
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateBookByID :one
UPDATE "books"
SET title = $2,
    genre = $3
WHERE id = $1
RETURNING *;

-- name: DeleteBookByID :exec
DELETE FROM "books"
WHERE id = $1;