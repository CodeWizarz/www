import { calculateBasePrice, calculateTotal, tiers } from '../../../source/javascripts/pricing-calculator-utilities.js'

describe('source/javascripts/pricing-calculator.js', () => {
    describe('free tier calculations', () => {
        it('calculates the correct result within tier limits', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 400;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(0);
        })
        it ('calculates the correct result when minutes are slightly over tier limit', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 401;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(10);
        })
        it('calculates the correct result when minutes are well over tier limit', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 1400;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(120);
        })
        it('calculates the correct result when storage is slightly over tier limit', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 400;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(60);
        })
        it('calculates the correct result when storage is over the tier limit but still within 10', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 400;
            const storage = 20;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(60);
        })
        it('calculates the correct result when storage is well over tier limit', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 400;
            const storage = 21;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(120);
        })
        it('calculates the correct result when both minutes and storage are over tier limit', () => {
            const tier = tiers.free;
            const users = 10;
            const minutes = 1400;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(180);
        })
    })
    describe('premium tier calculations', () => {
        it('calculates the correct result within tier limits', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10000;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2280);
        })
        it ('calculates the correct result when minutes are slightly over tier limit', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10001;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2290);
        })
        it('calculates the correct result when minutes are well over tier limit', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 11000;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2400);
        })
        it('calculates the correct result when storage is slightly over tier limit', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10000;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2340);
        })
        it('calculates the correct result when storage is over the tier limit but still within 10', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10000;
            const storage = 20;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2340);
        })
        it('calculates the correct result when storage is well over tier limit', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10000;
            const storage = 21;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2400);
        })
        it('calculates the correct result when both minutes and storage are over tier limit', () => {
            const tier = tiers.premium;
            const users = 10;
            const minutes = 10001;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(2350);
        })
    })
    describe('ultimate tier calculations', () => {
        it('calculates the correct result within tier limits', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50000;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(11880);
        })
        it ('calculates the correct result when minutes are slightly over tier limit', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50001;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(11890);
        })
        it('calculates the correct result when minutes are well over tier limit', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 51000;
            const storage = 10;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(12000);
        })
        it('calculates the correct result when storage is slightly over tier limit', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50000;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(11940);
        })
        it('calculates the correct result when storage is over the tier limit but still within 10', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50000;
            const storage = 20;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(11940);
        })
        it('calculates the correct result when storage is well over tier limit', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50000;
            const storage = 21;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(12000);
        })
        it('calculates the correct result when both minutes and storage are over tier limit', () => {
            const tier = tiers.ultimate;
            const users = 10;
            const minutes = 50001;
            const storage = 11;
            expect(calculateTotal(tier, users, minutes, storage)).toBe(11950);
        })
    })
})
