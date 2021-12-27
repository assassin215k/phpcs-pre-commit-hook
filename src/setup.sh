#!/bin/sh

if [ -e .git/hooks/pre-commit ];
then
    PRE_COMMIT_EXISTS=1
else
    PRE_COMMIT_EXISTS=0
fi

if [ ! -d .git/hooks ]; then
  mkdir -p .git/hooks
fi

cp vendor/assassin215k/phpcs-pre-commit-hook/src/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

if [ "$PRE_COMMIT_EXISTS" = 0 ];
then
    echo "Pre-commit git hook is installed!"
else
    echo "Pre-commit git hook is updated!"
fi

php vendor/squizlabs/php_codesniffer/bin/phpcs --config-set installed_paths vendor/escapestudios/symfony2-coding-standard
