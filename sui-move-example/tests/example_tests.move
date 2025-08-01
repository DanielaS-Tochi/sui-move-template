#[test_only]
module example::counter_tests {
    use example::counter;
    use sui::test_scenario;

    #[test]
    fun test_counter() {
        let user = @0x1;
        let scenario_val = test_scenario::begin(user);
        let scenario = &mut scenario_val;

        {
            counter::create(test_scenario::ctx(scenario));
        };

        test_scenario::next_tx(scenario, user);
        {
            let counter = test_scenario::take_from_sender<counter::Counter>(scenario);
            counter::increment(&mut counter);
            assert!(counter.count == 1, 0);
            test_scenario::return_to_sender(scenario, counter);
        };

        test_scenario::end(scenario_val);
    }
}