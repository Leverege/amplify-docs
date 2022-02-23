#./bin/sh
mkdocs build && firebase deploy --only hosting:dev-amplify-docs
