# AccuTerra SDK Distribution

This directory contains the binary distribution configuration for the AccuTerra SDK.

## Overview

This Package.swift defines the AccuTerraSDKCore and AccuTerraSDK as a binary targets that references the `AccuTerraSDKCore.xcframework` and `AccuTerraSDK.xcframework`.

## Dependencies

The binary target declares all external dependencies that the SDK requires at runtime. These will be automatically resolved when SDK is added to a project.

## Usage

Add this SDK to your projects by referencing the published package repository. Always add the SDKCore target, because it contains core SDK functionality.
Add the SDK target if you are planning to use the SDK with MapLibre or if you want to use offline map cache features.
