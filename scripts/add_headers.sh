#!/bin/bash

DUBSACKS_DIR="E:\raw\dubsacks\dubsacks20100208"

function start_header {
  echo """$2 This file is part of Dubsacks.
$2 --------------------------------
$2 Dubsacks is Copyright © 2009, 2010 Landon Bouma.
$2 
$2 Dubsacks is free software: you can redistribute it and/or modify
$2 it under the terms of the GNU General Public License as published by
$2 the Free Software Foundation, either version 3 of the License, or
$2 (at your option) any later version.
$2 
$2 Dubsacks is distributed in the hope that it will be useful,
$2 but WITHOUT ANY WARRANTY; without even the implied warranty of
$2 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
$2 GNU General Public License for more details.
$2 
$2 You should have received a copy of the GNU General Public License
$2 along with Dubsacks. If not, see <http://www.gnu.org/licenses/>.
""" > $1
}

function add_header {
  echo "Processing $1"
  mv $1 $1.tmp20100208
  start_header $1 $2
  cat $1.tmp20100208 >> $1
  rm -f $1.tmp20100208
}

for f in $(find $DUBSACKS_DIR -type f -name .bash*); do
  add_header $f '#'
done

for f in $(find $DUBSACKS_DIR -type f -name *vim*); do
  add_header $f '"'
done

