#!/bin/bash
BASEDIR=$(dirname $0)
DATABASE=brewery_finder_cdn
psql -U postgres -f "$BASEDIR/dropdb.sql" &&
createdb -U postgres $DATABASE &&
psql -U postgres -d $DATABASE -f "$BASEDIR/schema.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/beertype.sql" &&
psql -U postgres -d $DATABASE -f "$BASEDIR/user.sql"
