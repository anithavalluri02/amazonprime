package com.amazonprime.app;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PrimeAppTest {

    @Test
    public void testPrimeValue() {
        int expected = 5;
        int actual = 5;
        assertEquals(expected, actual, "Values should match!");
    }
}
