## Get the folder

In the terminal, navigate to the folder of your choice and run :
```
git clone git@github.com:HugsDaniel/livecode.git
cd livecode
```

To run the specs (some kind of rake), run :

`rspec`

Work on it until everything is green !


## What's your number?

Write a #french_ssn_info method extracting infos from French SSN (Social Security Number) using RegExp.

Valid French social security numbers have the following pattern:

`1 84 12 76 451 089 46`

* Gender (1 == man, 2 == woman)
* Year of birth (84)
* Month of birth (12)
* Department of birth (76, basically included between 01 and 99)
* 6 random digits (451 089)
* A 2 digits key (46, equal to the remainder of the division of (97 - ssn_without_key) by 97.)

The method must return the following strings:

```
french_ssn_info("1 84 12 76 451 089 46")
=> "a man, born in December, 1984 in Seine-Maritime."

french_ssn_info("123")
=> "The number is invalid"
```
