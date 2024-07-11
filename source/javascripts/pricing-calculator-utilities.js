/** 
 * Initialize the pricing calculator.
 * Depends on a DOM element with the `calcform` ID to become the `calculator` const.
 * Depends on a child element of `calculator` to match the `input.reset` selector.
 * Sets up event listeners on `calculator` and its resetButton`
 */
export function initializePricingCalculator() {
    const calculator = document.querySelector("#calcform");
    const resetButton = calculator.querySelector('input.reset');
    calculator.addEventListener('submit', function () {
        return false;
    })
    calculator.addEventListener('input', handleFormInput)
    resetButton.addEventListener('click', function () {
        calculator.reset();
    })
}

/** 
 * Handle `input` events on child elements of the `calculator` form
 * Since this bubbles up `input` events from child elements, but we care about each value,
 * it finds and parses the current input values each time.
 * 
 * It's not a huge performance cost, but eventually we should refactor this to handle data a little smarter,
 * maybe use some state to represent values which don't change until they receive an input event themselves.
 * 
 * Gets the selected tier (an object of tier values), users, minutes, and storage.
 * 
 * We assume that users, minutes, and storage are all integer values. 
 * 
 * Then we get the calculated total based on the form data. If it's not `NaN` (which would be triggered by a backspace in a field),
 * we update the `totalOutput` field with the value of `calculatedTotal`.
 */
export function handleFormInput() {
    const calculator = document.querySelector("#calcform");
    const tierSelect = calculator.querySelector('[name="Tier"]');
    const usersInput = calculator.querySelector('[name="Users"]');
    const minutesInput = calculator.querySelector('[name="Minutes"]');
    const storageInput = calculator.querySelector('[name="Storage"]')
    const totalOutput = calculator.querySelector('[name="Total"]');
    const selectedTier = tiers[tierSelect.value];
    const users = parseInt(usersInput.value);
    const minutes = parseInt(minutesInput.value);
    const storage = parseInt(storageInput.value);
    const calculatedTotal = calculateTotal(selectedTier, users, minutes, storage);

    if (!isNaN(calculatedTotal)) {
        totalOutput.value = calculatedTotal
    }
}

/** GitLab tier pricing information. */
export const tiers = {
    free: {
        price: 0,
        minuteLimit: 400,
        storageLimit: 10
    },
    premium: {
        price: 19,
        minuteLimit: 10000,
        storageLimit: 10
    },
    ultimate: {
        price: 99,
        minuteLimit: 50000,
        storageLimit: 10
    }
}

/**
 * Calculates the total
 * @param {object} tier - tier information, configurable in `tiers` object
 * @param {number} users - number of users in annual cost calculation
 * @param {number} minutes - number of compute minutes per month
 * @param {number} storage - number of GB of storage
 * @returns {number}
 */
export function calculateTotal(tier, users, minutes, storage) {
    const basePrice = calculateBasePrice(tier.price, users);
    const minutesModifier = calculateMinutesModifier(tier.minuteLimit, minutes);
    const storageModifier = calculateStorageModifier(tier.storageLimit, storage);

    return basePrice + minutesModifier + storageModifier
}

/**
 * Calculates the base price for a plan
 * @param {object} price - tier price
 * @param {number} users - number of users in annual cost calculation
 * @returns {number}
 */
export function calculateBasePrice(price, users) {
    return price * users * 12;
}

/**
 * Calculates additional compute minute charges
 * @param {object} minuteLimit - tier compute minutes limit
 * @param {number} minutes - number of minutes used per month
 * @returns {number}
 */
export function calculateMinutesModifier(minuteLimit, minutes) {
    if (minutes > minuteLimit) {
        const difference = minutes - minuteLimit;
        const annualDifference = difference * 12;
        const annualDifferenceRoundedUp = Math.ceil(annualDifference / 1000) * 1000;
        const basePricingUnit = annualDifferenceRoundedUp / 1000;
        const minutesCost = basePricingUnit * 10;
        return minutesCost;
    } else {
        return 0;
    }
}

/**
 * Calculates additional storage charges
 * @param {object} storageLimit - tier storage limit
 * @param {number} storage - number of GB of storage used
 * @returns {number}
 */
export function calculateStorageModifier(storageLimit, storage) {
    if (storage > storageLimit) {
        const difference = storage - storageLimit;
        const annualDifferenceRoundedUp = Math.ceil(difference / 10);
        const storageCost = annualDifferenceRoundedUp * 60;
        return storageCost;
    } else {
        return 0;
    }
}
