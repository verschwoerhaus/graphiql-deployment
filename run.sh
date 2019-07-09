#!/bin/sh
if [ "$HOST_AT_ROOT" == 1 ]
then
  mkdir graphiql
  mv static/ graphiql
fi

serve -l 8080 -s
