#!/bin/bash

/usr/local/bin/appledoc \
--project-name "Cocoa Logic" \
--project-company "Adrian Bigland" \
--company-id "com.adrianbigland" \
--docset-atom-filename "LCLogic.atom" \
--output "~/help" \
--publish-docset \
--logformat xcode \
--keep-undocumented-objects \
--keep-undocumented-members \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--ignore "*.m" \
--index-desc "${PROJECT_DIR}/README.md" \
"${PROJECT_DIR}"