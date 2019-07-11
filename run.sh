#!/bin/sh
mkdir graphiql
ln -s $(pwd)/static/ graphiql/static

serve -l 8080 -s
