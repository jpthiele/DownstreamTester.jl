using DownstreamTester: get_test_location

@testset "get_test_location" begin

    # Working state
    @test get_test_location(
        "Test Failed at /home/runner/.julia/packages/ExtendableGrids/nOn1T/test/runtests.jl:484\n" *
            "Expression: sha_code == \"9596c59f6b0870dd4a42a7a48725c2257f260757e15cc5ac433e5e8e235659d9\"" *
            "Evaluated: \"28a786f7c929dd592eb428d95cb1dcd77e92bd2dce696613ac26440d44597aea\" == \"9596c59f6b0870dd4a42a7a48725c2257f260757e15cc5ac433e5e8e235659d9\"",
        "ExtendableGrids"
    ) == "test/runtests.jl:484"

    # Aqua treatment

    @test get_test_location(
        "Aqua: Test Failed at /home/runner/.julia/packages/Aqua/epbUr/src/persistent_tasks.jl:38\n" *
            "Expression: !(has_persistent_tasks(package; kwargs...))" *
            "Evaluated: !(has_persistent_tasks(Base.PkgId(Base.UUID(\"82b139dc-5afc-11e9-35da-9b9bdfd336f3\"), \"VoronoiFVM\")))",
        "VoronoiFVM"
    ) == "AQUA/src/persistent_tasks.jl:38"

    # Other package location
    @test get_test_location(
        "Test Failed at /home/runner/.julia/packages/ExtendableGrids/nOn1T/test/runtests.jl:484\n" *
            "Expression: sha_code == \"9596c59f6b0870dd4a42a7a48725c2257f260757e15cc5ac433e5e8e235659d9\"" *
            "Evaluated: \"28a786f7c929dd592eb428d95cb1dcd77e92bd2dce696613ac26440d44597aea\" == \"9596c59f6b0870dd4a42a7a48725c2257f260757e15cc5ac433e5e8e235659d9\"",
        "VoronoiFVM"
    ) == "Test Failed at /home/runner/.julia/packages/ExtendableGrids/nOn1T/test/runtests.jl:484"

end
