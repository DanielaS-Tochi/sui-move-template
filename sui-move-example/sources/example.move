module example::counter {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::transfer;

    struct Counter has key, store {
        id: UID,
        count: u64,
    }

    public entry fun create(ctx: &mut TxContext) {
        let counter = Counter {
            id: object::new(ctx),
            count: 0,
        };
        transfer::public_transfer(counter, ctx.sender());
    }

    public entry fun increment(counter: &mut Counter) {
        counter.count = counter.count + 1;
    }
}