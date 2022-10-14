-- +goose Up

-- +goose StatementBegin

CREATE TABLE
    books (
        id BIGSERIAL PRIMARY KEY,
        title text NOT NULL,
        genre text
    );

-- +goose StatementEnd

-- +goose Down

-- +goose StatementBegin

DROP TABLE books;

-- +goose StatementEnd