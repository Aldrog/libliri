import qbs 1.0

QtApplication {
    name: "tst_liri_core"
    condition: project.autotestEnabled
    type: base.concat(["autotest"])

    Depends { name: "Qt"; submodules: ["core", "qml", "testlib"] }
    Depends { name: "LiriCore" }
    Depends { name: "LiriModels" }

    files: ["*.cpp"]
}
