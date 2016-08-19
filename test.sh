#! /bin/bash

TEST_CMD="xcodebuild -scheme MovingHelperTests -project MovingHelper.xcodeproj -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.3' build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
