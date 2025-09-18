// AccuTerraSDKWrapper.swift
// This file serves as a wrapper to ensure all dependencies are properly linked

import Foundation

// Re-export the AccuTerraSDK module when available (this will work when consumed by other packages)
#if canImport(AccuTerraSDK)
@_exported import AccuTerraSDK
#endif

// Import all dependencies to ensure they are properly linked and available to the binary target
// These imports ensure the modules are linked into the final app

#if canImport(MapLibre)
import MapLibre
#endif