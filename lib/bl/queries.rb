# MIT License
#
# Copyright (c) 2018 Daniel Oltmanns
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
module Bl
  module Queries
    NEW_USER = <<-SQL
    INSERT INTO users(fullname, username, password, github, email, bio)
    VALUES ($1, $2, $3, $4, $5, $6)
    SQL

    UPDATE_USER = <<-SQL
    UPDATE users
    SET {FIELD}=$2
    WHERE username=$1
    SQL

    DELETE_USER = <<-SQL
    DELETE FROM users
    WHERE username=$1
    SQL

    GET_USER = <<-SQL
    SELECT * FROM users
    WHERE username=$1
    SQL

    NEW_ARTICLE = <<-SQL
    INSERT INTO articles(author, slug, title, abstract, content, is_draft)
    VALUES ($1, $2, $3, $4, $5, $6)
    SQL

    GET_ARTICLES_PUBLISHED = <<-SQL
    SELECT * FROM articles
    WHERE is_draft='false'
    ORDER BY created_date DESC
    OFFSET $1 LIMIT $2
    SQL

    GET_ARTICLES_DRAFT_OR_PUBLISHED = <<-SQL
    SELECT * FROM articles
    ORDER BY created_date DESC
    OFFSET $1 LIMIT $2
    SQL

    GET_ARTICLES_PUBLISHED_COUNT = <<-SQL
    SELECT COUNT(article_id) AS count FROM articles
    SQL
  end
end
