#!/bin/sh

echo "installing or updating script dependencies (tests are skipped)"

cpan -T HTTP::Tiny HTML::TreeBuilder

cpan -T DateTime