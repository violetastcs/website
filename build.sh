#!/usr/bin/env sh

# build.sh
# by: Violetas (The Coom Slayer) <violet.hates.glowies@protonmail.com>, January 2021
# description: simple static site generator written in POSIX shell script.

# This file is part of Violetas' website.
#
# Violetas' website is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Violetas' website is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Violetas' website. If not, see <https://www.gnu.org/licenses/>.

rm -rf build

mkdir -p build/static build/posts build/serve

./templates/index.html.sh > build/index.html

for post in $(find content/posts -type f | grep "\.md"); do
	meta="$(cat $post | sed '1,/===/!d' | sed '/===/d')"
	eval "$meta"
	content="$(cat $post | sed '1,/^===$/d')"
	path="$(echo $post | sed 's/md/html/g' | sed 's/content/build/g')"
	mkdir -p $(dirname $path)
	./templates/post.html.sh "$content" "$backg" "$title" "$colour" > $path
done

for item in $(find content/ -type f | grep -v "\.md"); do
	path="$(echo $item | sed 's/content/build/g')"
	mkdir -p $(dirname $path)
	cp $item $path
done

cp -r static/* build/static/
cp -r serve/* build/serve/
