// !$*UTF8*$!
{
    archiveVersion = 1;
    classes = {};
    objectVersion = 56;
    objects = {

        0F6E2C052C35080A00F5A1D3 /* TeamSalesTrackerApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0F6E2C042C35080A00F5A1D3 /* TeamSalesTrackerApp.swift */; };
        0F6E2C072C35080A00F5A1D3 /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0F6E2C062C35080A00F5A1D3 /* ContentView.swift */; };
        0F6E2C092C35080A00F5A1D3 /* Models.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0F6E2C082C35080A00F5A1D3 /* Models.swift */; };
        0F6E2C0B2C35080A00F5A1D3 /* DataStore.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0F6E2C0A2C35080A00F5A1D3 /* DataStore.swift */; };
        0F6E2C0D2C35080A00F5A1D3 /* AddDealView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0F6E2C0C2C35080A00F5A1D3 /* AddDealView.swift */; };

        0F6E2C0E2C35080A00F5A1D3 /* TeamSalesTracker.app */ = {isa = PBXFileReference; lastKnownFileType = wrapper.application; path = "TeamSalesTracker.app"; sourceTree = BUILT_PRODUCTS_DIR; };
        0F6E2C112C35080A00F5A1D3 /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; };

        0F6E2C1A2C35080A00F5A1D3 /* Project object */ = {
            isa = PBXProject;
            attributes = {
                LastSwiftUpgradeCheck = 1600;
                LastUpgradeCheck = 1600;
                ORGANIZATIONNAME = "mattwillett123";
                TargetAttributes = {
                    0F6E2CFA2C35080A00F5A1D3 = { CreatedOnToolsVersion = 16.0; };
                };
            };
            buildConfigurationList = 0F6E2C1C2C35080A00F5A1D3 /* Build configuration list for PBXProject "TeamSalesTracker" */;
            compatibilityVersion = "Xcode 14.0";
            developmentRegion = en;
            hasScannedForEncodings = 0;
            knownRegions = (
                en,
                Base,
            );
            mainGroup = 0F6E2C1D2C35080A00F5A1D3;
            productRefGroup = 0F6E2C1E2C35080A00F5A1D3;
            projectDirPath = "";
            projectRoot = "";
            targets = (
                0F6E2CFA2C35080A00F5A1D3,
            );
        };

        0F6E2C1C2C35080A00F5A1D3 /* Build configuration list for PBXProject "TeamSalesTracker" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                0F6E2C212C35080A00F5A1D3,
                0F6E2C222C35080A00F5A1D3,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };

        0F6E2C1D2C35080A00F5A1D3 /* TeamSalesTracker */ = {
            isa = PBXGroup;
            children = (
                0F6E2C042C35080A00F5A1D3,
                0F6E2C062C35080A00F5A1D3,
                0F6E2C082C35080A00F5A1D3,
                0F6E2C0A2C35080A00F5A1D3,
                0F6E2C0C2C35080A00F5A1D3,
                0F6E2C112C35080A00F5A1D3,
            );
            path = TeamSalesTracker;
            sourceTree = "<group>";
        };

        0F6E2C1E2C35080A00F5A1D3 /* Products */ = {
            isa = PBXGroup;
            children = (
                0F6E2C0E2C35080A00F5A1D3,
            );
            name = Products;
            sourceTree = "<group>";
        };

        0F6E2C212C35080A00F5A1D3 /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = "com.mattwillett123.TeamSalesTracker";
                PRODUCT_NAME = "TeamSalesTracker";
                SWIFT_VERSION = 5.9;
            };
            name = Debug;
        };

        0F6E2C222C35080A00F5A1D3 /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ALWAYS_SEARCH_USER_PATHS = NO;
                CLANG_ANALYZER_NONNULL = YES;
                CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
                CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
                CLANG_ENABLE_MODULES = YES;
                CLANG_ENABLE_OBJC_ARC = YES;
                CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
                CLANG_WARN_BOOL_CONVERSION = YES;
                CLANG_WARN_COMMA = YES;
                CLANG_WARN_CONSTANT_CONVERSION = YES;
                CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
                CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
                CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
                CLANG_WARN_EMPTY_BODY = YES;
                CLANG_WARN_ENUM_CONVERSION = YES;
                CLANG_WARN_INFINITE_RECURSION = YES;
                CLANG_WARN_INT_CONVERSION = YES;
                CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
                CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
                CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
                CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
                CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
                CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
                CLANG_WARN_SUSPICIOUS_MOVE = YES;
                CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
                CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                GENERATE_INFOPLIST_FILE = YES;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = "com.mattwillett123.TeamSalesTracker";
                PRODUCT_NAME = "TeamSalesTracker";
                SWIFT_VERSION = 5.9;
            };
            name = Release;
        };

        0F6E2C232C35080A00F5A1D3 /* Debug */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = "";
                INFOPLIST_FILE = TeamSalesTracker/Info.plist;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/Frameworks";
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = "com.mattwillett123.TeamSalesTracker";
                PRODUCT_NAME = TeamSalesTracker;
                SWIFT_VERSION = 5.9;
            };
            name = Debug;
        };

        0F6E2C242C35080A00F5A1D3 /* Release */ = {
            isa = XCBuildConfiguration;
            buildSettings = {
                ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
                ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
                CODE_SIGN_STYLE = Automatic;
                CURRENT_PROJECT_VERSION = 1;
                DEVELOPMENT_TEAM = "";
                INFOPLIST_FILE = TeamSalesTracker/Info.plist;
                IPHONEOS_DEPLOYMENT_TARGET = 17.0;
                LD_RUNPATH_SEARCH_PATHS = "$(inherited) @executable_path/Frameworks";
                MARKETING_VERSION = 1.0;
                PRODUCT_BUNDLE_IDENTIFIER = "com.mattwillett123.TeamSalesTracker";
                PRODUCT_NAME = TeamSalesTracker;
                SWIFT_VERSION = 5.9;
            };
            name = Release;
        };

        0F6E2CFA2C35080A00F5A1D3 /* TeamSalesTracker */ = {
            isa = PBXNativeTarget;
            buildConfigurationList = 0F6E2CFC2C35080A00F5A1D3 /* Build configuration list for PBXNativeTarget "TeamSalesTracker" */;
            buildPhases = (
                0F6E2CFB2C35080A00F5A1D3 /* Sources */,
                0F6E2CFD2C35080A00F5A1D3 /* Frameworks */,
            );
            buildRules = (
            );
            dependencies = (
            );
            name = TeamSalesTracker;
            productName = TeamSalesTracker;
            productReference = 0F6E2C0E2C35080A00F5A1D3;
            productType = "com.apple.product-type.application";
        };

        0F6E2CFB2C35080A00F5A1D3 /* Sources */ = {
            isa = PBXSourcesBuildPhase;
            files = (
                0F6E2C052C35080A00F5A1D3,
                0F6E2C072C35080A00F5A1D3,
                0F6E2C092C35080A00F5A1D3,
                0F6E2C0B2C35080A00F5A1D3,
                0F6E2C0D2C35080A00F5A1D3,
            );
        };

        0F6E2CFD2C35080A00F5A1D3 /* Frameworks */ = {
            isa = PBXFrameworksBuildPhase;
            files = (
            );
        };

        0F6E2CFC2C35080A00F5A1D3 /* Build configuration list for PBXNativeTarget "TeamSalesTracker" */ = {
            isa = XCConfigurationList;
            buildConfigurations = (
                0F6E2C232C35080A00F5A1D3,
                0F6E2C242C35080A00F5A1D3,
            );
            defaultConfigurationIsVisible = 0;
            defaultConfigurationName = Release;
        };
    };
    rootObject = 0F6E2C1A2C35080A00F5A1D3;
}
