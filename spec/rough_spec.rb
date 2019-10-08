=begin

tests

receives "Donald Trump\n", returns "Donald Trump, no cohort"
receives " \n", returns "_____, no cohort"
receives "eden ahbez\n", returns "eden ahbez, no cohort"
receives "   Donald Trump   \n", returns "Donald Trump, no cohort"
receives "March\n", returns "March, no cohort"
receives "Donald Trump, march\n", returns "Donald Trump, March cohort"
receives "Donald Trump, March\n", returns "Donald Trump, March cohort"
receives "Donald Trump,   March    \n", returns "Donald Trump, March cohort"
receives "Donald Trump,March\n" returns "Donald Trump, March cohort"
receives "Donald Trump, dkjfhdkfjb\n", returns "Donald Trump, no cohort"
receives "Donald Trump, Mach\n" returns "Donald Trump, no cohort"