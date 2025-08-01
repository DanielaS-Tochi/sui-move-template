module example::counter {
    use sui::object::{Self, UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::event;

    /// A counter with a value that can be incremented and decremented
    struct Counter has key {
        id: UID,
        count: u64,
    }

    /// Event emitted when counter value changes
    struct CounterChanged has copy, drop {
        counter_id: ID,
        previous_value: u64,
        new_value: u64,
    }

    /// Error codes
    const ENegativeCounter: u64 = 0;

    /// Creates a new counter with initial value 0
    public fun create(ctx: &mut TxContext): Counter {
        Counter {
            id: object::new(ctx),
            count: 0
        }
    }

    /// Creates and transfers a Counter to the transaction sender
    public entry fun create_and_transfer(ctx: &mut TxContext) {
        let counter = create(ctx);
        transfer::transfer(counter, tx_context::sender(ctx));
    }

    /// Increments the counter by 1
    public entry fun increment(counter: &mut Counter) {
        let previous = counter.count;
        counter.count = counter.count + 1;
        
        event::emit(CounterChanged {
            counter_id: object::uid_to_inner(&counter.id),
            previous_value: previous,
            new_value: counter.count
        });
    }

    /// Decrements the counter by 1
    public entry fun decrement(counter: &mut Counter) {
        assert!(counter.count > 0, ENegativeCounter);
        let previous = counter.count;
        counter.count = counter.count - 1;

        event::emit(CounterChanged {
            counter_id: object::uid_to_inner(&counter.id),
            previous_value: previous,
            new_value: counter.count
        });
    }

    /// Returns the current value of the counter
    public fun get_count(counter: &Counter): u64 {
        counter.count
    }

    #[test]
    fun test_counter_create() {
        use sui::test_scenario;
        
        let user = @0xCAFE;
        let scenario = test_scenario::begin(user);
        
        // Create counter
        let counter = create(test_scenario::ctx(&mut scenario));
        assert!(get_count(&counter) == 0, 0);
        
        // Increment
        increment(&mut counter);
        assert!(get_count(&counter) == 1, 1);
        
        // Decrement
        decrement(&mut counter);
        assert!(get_count(&counter) == 0, 2);
        
        test_scenario::end(scenario);
    }
}