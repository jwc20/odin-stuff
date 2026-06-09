# Odin Problem Set by Chapter

Source: uploaded Odin text covering Chapters 3 to 6.

## How to Use This Problem Set

- Problems marked **Code** should be answered with the exact or near-exact code example from the text.
- Problems marked **Concept** should be answered in your own words.
- The answer key is included after each chapter.
- The set is organized by chapter and covers the code examples from the uploaded text.

---

# Chapter 3: Variables and Constants

## Problems

1. **Code:** Declare a variable named `number` with type `int` without assigning a value.
2. **Concept:** What value does an Odin variable have if you declare it without assigning a value?
3. **Code:** Show how to declare an `int` variable but leave it non-initialized.
4. **Concept:** Why is leaving a variable non-initialized usually avoided?
5. **Code:** Declare `number` as an `int`, then assign it the value `7`.
6. **Code:** Declare and assign `number` to `7` in one line using type inference.
7. **Concept:** What does type inference mean in `number := 7`?
8. **Code:** Write the small program that prints `number`, changes it, then prints it again.
9. **Code:** Give the multi-line comment example.
10. **Concept:** When should you use `:=` instead of `=`?
11. **Code:** Declare a variable named `decimal_number` with type `f32`.
12. **Concept:** What does the `f` in `f32` stand for?
13. **Code:** Initialize an `f32` variable to `7` by writing the type on the left side.
14. **Code:** Initialize an `f32` variable to `7` by casting the value on the right side.
15. **Concept:** What does `f32(7)` do?
16. **Code:** Declare an `f32` variable and initialize it to `7.42`.
17. **Code:** Use type inference with `7.42`.
18. **Concept:** What type is inferred from `decimal_number := 7.42`?
19. **Code:** Show the snippet where assigning plain `7` to an `f32` compiles.
20. **Code:** Show the snippet where assigning an `int` variable to an `f32` variable does not compile.
21. **Code:** Fix the previous issue by explicitly casting `number` to `f32`.
22. **Concept:** Why can `decimal_number: f32 = 7` compile, but `decimal_number: f32 = number` fail?
23. **Code:** Show the example where an `f32` variable is declared and later assigned plain `7`.
24. **Code:** Create a named constant with the value `12`.
25. **Concept:** What operator is used to create named constants?
26. **Code:** Assign a named constant to a variable.
27. **Code:** Show the equivalent inferred variable assignment for the constant value `12`.
28. **Concept:** What does it mean that named constants are like being copy-pasted at compile time?
29. **Code:** Show the constant that is too large for an `i8` variable.
30. **Concept:** What is the biggest value an `i8` can contain?
31. **Code:** Show an Untyped Float constant that cannot be assigned to an `int` variable.
32. **Code:** Show an Untyped Float with all zero decimals assigned to an `int` variable.
33. **Code:** Show the equivalent direct assignment of `7.0` to an `int`.
34. **Code:** Show a decimal value that cannot fit into `i8`.
35. **Concept:** What does it mean for an Untyped Float to be converted to an integer without truncation?
36. **Code:** Use type inference with `13.38`.
37. **Concept:** What is the default inferred type for an Untyped Integer?
38. **Concept:** What is the default inferred type for an Untyped Float?
39. **Code:** Show assigning `7.42` to a previously declared `f32` variable.
40. **Code:** Create an explicitly typed constant of type `f32`.
41. **Code:** Compare that constant syntax with a variable declaration of type `f32`.
42. **Code:** Show the two valid assignments of `0.5` to `f32` and `f64` variables.
43. **Concept:** Why does Odin let `0.5` be assigned to both `f32` and `f64` without writing `0.5f`?
44. **Concept:** What is a literal?
45. **Concept:** List the signed integer types mentioned in the text.
46. **Concept:** List the unsigned integer types mentioned in the text.
47. **Concept:** List the floating point types mentioned in the text.
48. **Concept:** What is the zero value of `bool`?
49. **Concept:** What is the zero value of `string`?
50. **Concept:** What is a `rune`?
51. **Code:** Give the inferred type example for an Untyped Boolean.
52. **Code:** Give the example of an integer constant too large for `i8` from the Untyped Integer summary.
53. **Code:** Give the inferred type example for an Untyped Integer.
54. **Code:** Give the inferred type example for an Untyped Float.
55. **Code:** Give the inferred type example for an Untyped String.
56. **Code:** Give the inferred type example for an Untyped Rune.
57. **Code:** Give the Untyped Rune example that will not compile because it does not fit into `i8`.
58. **Code:** Give the Untyped nil type inference example that will not compile.

## Answer Key

1.

```odin
number: int
```

2. It has the zero value. For an integer, that means `0`.

3.

```odin
number: int = ---
```

4. It can leave garbage memory and cause bugs. Odin normally zero-initializes variables.

5.

```odin
number: int
number = 7
```

6.

```odin
number := 7
```

7. The compiler looks at `7` and infers that `number` should be an `int`.

8.

```odin
package variable_example

import "core:fmt"

main :: proc() {
	number := 7
	fmt.println(number) // prints 7
	number = 12
	fmt.println(number) // prints 12
} 
```

9.

```odin
/* comment */
```

10. Use `:=` when declaring and initializing a new variable. Use `=` when assigning to an existing variable.

11.

```odin
decimal_number: f32
```

12. `f` stands for floating point number.

13.

```odin
decimal_number: f32 = 7
```

14.

```odin
decimal_number := f32(7)
```

15. It casts or converts `7` to the type `f32`.

16.

```odin
decimal_number: f32 = 7.42
```

17.

```odin
decimal_number := 7.42
```

18. The inferred type is `f64`.

19.

```odin
number := 7
decimal_number: f32 = 7
```

20.

```odin
number := 7
decimal_number: f32 = number
```

21.

```odin
decimal_number := f32(number)
```

22. Plain `7` is an Untyped Integer constant, so it can be implicitly converted to `f32`. But `number` is already an `int` variable, and Odin will not automatically convert an `int` variable to `f32`.

23.

```odin
decimal_number: f32
decimal_number = 7
```

24.

```odin
CONSTANT_NUMBER :: 12
```

25. The `::` operator.

26.

```odin
CONSTANT_NUMBER :: 12
number := CONSTANT_NUMBER
```

27.

```odin
number := 12
```

28. The compiler can replace the constant name with its value wherever the name appears.

29.

```odin
BIG_CONSTANT_NUMBER :: 100000000
small_number: i8 = BIG_CONSTANT_NUMBER
```

30. `127`.

31.

```odin
DECIMAL_CONSTANT :: 27.12
my_integer: int = DECIMAL_CONSTANT
```

32.

```odin
DECIMAL_CONSTANT :: 7.0
my_integer: int = DECIMAL_CONSTANT
```

33.

```odin
my_int: int = 7.0
```

34.

```odin
my_int: i8 = 400.0
```

35. It means no fractional part is lost. For example, `7.0` can become an integer, but `7.42` cannot.

36.

```odin
decimal_number := 13.38
```

37. `int`.

38. `f64`.

39.

```odin
decimal_number: f32
decimal_number = 7.42
```

40.

```odin
DECIMAL_CONSTANT: f32 : 7.42
```

41.

```odin
decimal_variable: f32 = 7.42
```

42.

```odin
decimal_32: f32
decimal_32 = 0.5

decimal_64: f64
decimal_64 = 0.5
```

43. Odin delays the final type choice for untyped constants until it needs to choose a specific type.

44. A literal is a value written directly in source code, such as `0.5` or `"cat"`.

45. `int`, `i8`, `i16`, `i32`, `i64`, `i128`.

46. `uint`, `u8`, `u16`, `u32`, `u64`, `u128`, `uintptr`.

47. `f16`, `f32`, `f64`.

48. `false`.

49. `""`, the empty string.

50. A single UTF-8 string code point, internally a 32 bit signed integer.

51.

```odin
some_variable := true
```

52.

```odin
some_variable: i8 = 10000
```

53.

```odin
some_variable := 7
```

54.

```odin
some_variable := 23.12
```

55.

```odin
some_variable := "Hellope"
```

56.

```odin
some_variable := 'A'
```

57.

```odin
x: i8 = '猫'
```

58.

```odin
some_variable := nil
```

---

# Chapter 4: Some Additional Basics

## Problems

1. **Code:** Define a procedure named `is_bigger_than` with two `int` parameters and one `bool` return value.
2. **Concept:** What does the `-> bool` part of the procedure declaration mean?
3. **Code:** Call `is_bigger_than` with `3` and `2`, then store the result.
4. **Concept:** What type is inferred for `result`?
5. **Code:** Write the basic shape of an Odin `if` statement.
6. **Concept:** What type must an Odin `if` condition be?
7. **Code:** Show the Odin way to use an integer in a condition.
8. **Code:** Check whether `some_variable` equals `7`, then print a message.
9. **Code:** List the comparison operators shown in the text.
10. **Concept:** What type does a comparison operator produce?
11. **Code:** Write the example that combines `&&`, `||`, and parentheses.
12. **Concept:** Which operator has precedence, `&&` or `||`?
13. **Code:** Show the multiplication and addition precedence examples.
14. **Code:** Show the short-circuiting example with `some_proc()`.
15. **Concept:** When will `some_proc()` not run in that example?
16. **Code:** Flip a boolean condition using `!`.
17. **Code:** Write an `if`, `else if`, and `else` chain.
18. **Code:** Show the invalid if-statement without curly braces.
19. **Code:** Write the allowed one-line `if` statement.
20. **Code:** Write the allowed `do` form of the if-statement.
21. **Code:** Write the full three-line if-statement preferred in the text.
22. **Code:** Write an infinite `for` loop.
23. **Code:** Give the two C equivalents mentioned for an infinite loop.
24. **Code:** Write an infinite loop that stops with `break` when `condition` is true.
25. **Code:** Write a loop that runs while `condition` is true.
26. **Code:** Give the C equivalent of that condition loop.
27. **Code:** Write a loop that prints `0` through `9` by manually increasing `i`.
28. **Code:** Move initialization, condition, and increment into the `for` line.
29. **Code:** Show how Odin increments by one without `++`.
30. **Concept:** Why does Odin avoid `++` and `--`?
31. **Code:** Give the C-style bug example using `i++`.
32. **Code:** Write the compact range loop from `0` to less than `10`.
33. **Code:** Write the range loop from `0` through `10`.
34. **Concept:** What is the difference between `..<` and `..=`?
35. **Code:** Write the nested loop with an `outer` label and `break outer`.
36. **Code:** Write the loop that skips printing `5` using `continue`.
37. **Code:** Show how to continue a labeled loop.
38. **Code:** Declare a fixed array of 10 integers.
39. **Concept:** What is a fixed array?
40. **Code:** Declare and initialize a fixed array of 10 integers.
41. **Code:** Show how to change the value of an existing array.
42. **Code:** Fetch the third item from `ten_ints`.
43. **Code:** Set item index `6` of `ten_ints` to `7`.
44. **Code:** Loop through all elements of `ten_ints`.
45. **Code:** Loop through all elements of `ten_ints` in reverse.
46. **Code:** Write the full “all together” program from the text.
47. **Concept:** What does `fmt.printfln("%v is bigger than %v", n, cmp)` do?
48. **Concept:** What will the “all together” program print?

## Answer Key

1.

```odin
is_bigger_than :: proc(number: int, compare_to: int) -> bool {
	return number > compare_to
}
```

2. It means the procedure returns a value of type `bool`.

3.

```odin
result := is_bigger_than(3, 2)
```

4. `bool`.

5.

```odin
if condition {
	// Code in here will run if `condition`
	// is true.
}
```

6. `bool`.

7.

```odin
if some_int > 0 {}
```

8.

```odin
some_variable := 7

if some_variable == 7 {
	fmt.println("It's seven!")
}
```

9.

```odin
== // left and right are equal
!= // left and right not equal
<  // left is less than right
<= // left is less than or equal to right
>  // left is greater than right
>= // left is greater than or equal to right
```

10. `bool`.

11.

```odin
if var1 == 7 && (var2 == 12 || var3 == 42) {
	// In here var1 is 7. And at least one
	// of the following is true:
	// var2 is 12 OR var3 is 42
}
```

12. `&&` is evaluated before `||`.

13.

```odin
x * y + z
```

```odin
x * (y + z)
```

14.

```odin
if var == 7 && some_proc() {
	// var is 7
	// some_proc() returned true
}
```

15. It will not run if `var` is not equal to `7`.

16.

```odin
some_variable := 7
my_condition := some_variable == 7

if !my_condition {
	fmt.println("some_variable is not 7")
}
```

17.

```odin
if some_variable > 7 {
	// some_variable is larger than 7
} else if some_other_variable == 2 {
	// some_variable is less or equal to 7
	// and some_other_variable is 2
} else {
	// some_variable is less or equal to 7
	// and some_other_variable is not 2
}
```

18.

```odin
if some_variable == 7
	some_proc()
```

19.

```odin
if some_variable == 7 { some_proc() }
```

20.

```odin
if some_variable == 7 do some_proc()
```

21.

```odin
if some_variable == 7 {
	some_proc()
}
```

22.

```odin
for {
	fmt.println("Printed over and over, forever")
}
```

23.

```c
while(true) {}
```

```c
for (;;) {}
```

24.

```odin
for {
	if condition {
		break
	}

	fmt.println("Printed over and over, until 'condition' becomes true")
}
```

25.

```odin
for condition {
	fmt.println("Printed over and over, until 'condition' becomes false")
}
```

26.

```c
while (condition) {}
```

27.

```odin
i := 0
for i < 10 {
	fmt.println(i) // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
	i += 1
}
```

28.

```odin
for i := 0; i < 10; i += 1 {
	fmt.println(i) // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
}
```

29.

```odin
i += 1
```

30. It removes subtle bugs related to evaluation order.

31.

```c
some_array[i++] = other_array[i];
```

32.

```odin
for i in 0..<10 {
	fmt.println(i) // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
}
```

33.

```odin
for i in 0..=10 {
	fmt.println(i) // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
}
```

34. `..<` excludes the upper bound. `..=` includes the upper bound.

35.

```odin
outer: for x in 0..<20 {
	for y in 0..<20 {
		if x == 5 && y == 5 {
			break outer
		}
	}
}
```

36.

```odin
for i in 0..<10 {
	if i == 5 {
		// skips printing "5"
		continue
	}
	fmt.println(i) // 0, 1, 2, 3, 4, 6, 7, 8, 9
}
```

37.

```odin
continue some_label
```

38.

```odin
ten_ints: [10]int
```

39. A fixed array is a list of items with a fixed length. It cannot be made longer or shorter.

40.

```odin
ten_ints := [10]int {
	61, 81, 12, 41, 5, 10, 1234, 8, 4, 1,
}
```

41.

```odin
ten_ints = { your ten numbers }
```

42.

```odin
third_item := ten_ints[2]
```

43.

```odin
ten_ints[6] = 7
```

44.

```odin
for n in ten_ints {
	fmt.println(n) // 61, 81, 12, 41, 5, 10, 1234, 8, 4, 1
}
```

45.

```odin
#reverse for n in ten_ints {
	fmt.println(n) // 1, 4, 8, 1234, 10, 5, 41, 12, 81, 61
}
```

46.

```odin
package just_the_basics

import "core:fmt"

main :: proc() {
	numbers := [10]int {
		6, 4, 7, 10, 1, -1, -9, 100, 1, 54,
	}

	cmp := 6

	for n in numbers {
		if is_bigger_than(n, cmp) {
			fmt.printfln("%v is bigger than %v", n, cmp)
		}	
	}
}

is_bigger_than :: proc(number: int, compare_to: int) -> bool {
	return number > compare_to
}
```

47. It replaces the two `%v` placeholders with `n` and `cmp` in that order.

48.

```text
7 is bigger than 6
10 is bigger than 6
100 is bigger than 6
54 is bigger than 6
```

---

# Chapter 5: Making New Types

## Problems

1. **Code:** Define a `Rectangle` struct with `x`, `y`, `width`, and `height` fields.
2. **Concept:** What is a struct used for?
3. **Code:** Create a variable named `rect` of type `Rectangle`.
4. **Code:** Initialize a `Rectangle` using named fields and `:=`.
5. **Concept:** What happens to fields that are not mentioned in a designated initializer?
6. **Code:** Initialize a `Rectangle` using the type between `:` and `=`.
7. **Code:** Reassign an existing `Rectangle` with new field values.
8. **Code:** Initialize a `Rectangle` without field names.
9. **Concept:** What is required when initializing a struct without field names?
10. **Code:** Define `Person_Stats` and `Person`, where `Person` contains `Person_Stats`.
11. **Code:** Create a zero-initialized `Person`.
12. **Concept:** Where does the memory for `stats` live inside `Person`?
13. **Code:** Show the `size_of` example for getting the size of a type.
14. **Code:** Initialize a nested `Person` value with `stats.health` and `name`.
15. **Code:** Fetch and set nested struct fields using `.`.
16. **Code:** Redefine `Person` using `using stats: Person_Stats`.
17. **Code:** Use fields of `stats` directly on a `Person` object.
18. **Concept:** What does `using` allow in the `Person` example?
19. **Code:** Define an `Entity` struct with an id and 2D position.
20. **Code:** Define a `Player` struct that uses `Entity` as a parent-like field.
21. **Code:** Define `Player` as a type alias of `Entity`.
22. **Code:** Create a `Player` and print its position.
23. **Code:** Pass a `Player` into a procedure that expects an `Entity`.
24. **Concept:** Why can `print_position(p)` work even though `p` is a `Player`?
25. **Concept:** Does Odin have classes or methods?
26. **Code:** Store a procedure inside a struct using `My_Interface`.
27. **Concept:** Why does the author not recommend using that pattern to implement methods?
28. **Code:** Define the `Computer_Type` enum.
29. **Concept:** What are enum members represented as underneath?
30. **Code:** Create a variable of type `Computer_Type`.
31. **Code:** Assign `.Mainframe` to `ct`.
32. **Code:** Show the fully qualified equivalent of `.Mainframe`.
33. **Code:** Use a `switch` statement with `Computer_Type`.
34. **Code:** Use if-statements to do the same enum branching.
35. **Concept:** Why is `switch` often preferred over the equivalent if-chain?
36. **Code:** Use `#partial switch` with only some enum members.
37. **Concept:** Why does the author avoid `#partial` unless there is a good reason?
38. **Code:** Define an enum where `Laptop` starts at `1`.
39. **Concept:** What problem can happen when an enum starts at `1` instead of `0`?
40. **Code:** Define an enum where all members have explicit values.
41. **Code:** Define an enum where numbering resumes after an explicit value.
42. **Code:** Define an enum with `u8` as its backing type.
43. **Concept:** When might you choose a custom enum backing type?
44. **Code:** Cast an enum to `int` before comparing it with an integer.
45. **Code:** Define `My_Union`, `Person_Data`, and initialize `val` with an `int`.
46. **Concept:** What can a union store that an enum alone cannot?
47. **Code:** Assign a `Person_Data` variant to `val`.
48. **Code:** Show the invalid union assignment that skips the variant type name.
49. **Concept:** Why must `Person_Data` be written when assigning that variant to `val`?
50. **Code:** Print the size of `My_Union`.
51. **Code:** Switch on the current variant of a union.
52. **Concept:** How is switching on a union different from switching on an enum?
53. **Code:** Make the union switch value modifiable with `&v`.
54. **Code:** Check whether a union currently holds an `f32` variant.
55. **Code:** Use the special if-statement form for checking an `f32` union variant.
56. **Code:** Assert that the union holds `f32` by skipping the `ok` value.
57. **Code:** Modify an `f32` union variant through a pointer.
58. **Code:** Define a nullable `Shape` union and create `shape`.
59. **Concept:** What is the zero value of that nullable union?
60. **Code:** Define a `Shape` enum and create `shape`.
61. **Concept:** What is the zero value of that enum?
62. **Code:** Define a `Shape` union with `#no_nil`.
63. **Concept:** What does `#no_nil` change about the union's zero value?
64. **Concept:** What does a union tag track?
65. **Concept:** What are the tag values for the nullable `Shape` union?
66. **Concept:** What are the tag values for the `#no_nil` `Shape` union?
67. **Code:** Show the generic `Maybe` union definition.
68. **Code:** Declare a `Maybe(int)` value.
69. **Code:** Assign and print a `Maybe(int)` value.
70. **Code:** Check whether a `Maybe(int)` has a value.
71. **Code:** Assert that a `Maybe(int)` has a value by skipping the `ok` value.
72. **Code:** Define a raw union using `struct #raw_union`.
73. **Concept:** What does `#raw_union` do?
74. **Code:** Define the initial “mega struct” `Entity` example.
75. **Code:** Refactor the entity fields into union variants.
76. **Code:** Create a `player_entity` with an `Entity_Player` variant.

## Answer Key

1.

```odin
Rectangle :: struct {
	x: f32,
	y: f32,
	width: f32,
	height: f32,
}
```

2. A struct groups fields together so you can reason about them as one larger thing.

3.

```odin
rect: Rectangle
```

4.

```odin
rect := Rectangle {
	width = 20,
	height = 10,
}
```

5. They are zero-initialized.

6.

```odin
rect: Rectangle = {
	width = 20,
	height = 10,
}
```

7.

```odin
rect := Rectangle {
	width = 20,
	height = 10,
}

// a bit later

rect = {
	x = 10,
	width = 5,
	height = 7,
}
```

8.

```odin
rect := Rectangle {
	20, 20,
	200, 200,
}
```

9. You must list all fields in the order they are defined.

10.

```odin
Person_Stats :: struct {
	health: int,
	age: int,
}

Person :: struct {
	stats: Person_Stats,
	name: string,
}
```

11.

```odin
p: Person
```

12. The memory for `stats` lives directly inside the `Person` struct.

13.

```odin
size_of(Some_Type)
```

14.

```odin
p := Person {
	stats = {
		health = 7,
	},
	name = "Bob",
}
```

15.

```odin
p := Person {
	stats = {
		health = 7,
	},
	name = "Bob",
}

p.name = "Bobinski"
p.stats.age = 36
bobinskis_health := p.stats.health
```

16.

```odin
Person_Stats :: struct {
	health: int,
	age: int,
}

Person :: struct {
	using stats: Person_Stats,
	name: string,
}
```

17.

```odin
p := Person {
	health = 20
}
p.age = 70

hs := p.health
```

18. It allows fields inside `stats` to be accessed directly on `p`, such as `p.age` or `p.health`.

19.

```odin
Entity :: struct {
	id: int,
	position: [2]f32,
}
```

20.

```odin
Player :: struct {
	using entity: Entity,
	can_jump: bool,
}
```

21.

```odin
Player :: Entity
```

22.

```odin
p := Player {
	id = 7,
	position = {5, 2},
	can_jump = true,
}

fmt.println(p.position) // [5, 2]
```

23.

```odin
p := Player {
	id = 7,
	position = {5, 2},
	can_jump = true,
}

print_position :: proc(e: Entity) {
	fmt.println(e.position) // [5, 2]
}

print_position(p)
```

24. Because `using entity: Entity` lets the embedded `Entity` field be implicitly sent along.

25. No. Odin has structs and separate procedures, not classes or methods.

26.

```odin
My_Interface :: struct {
	required_name_length: int,
	is_valid_name: proc(My_Interface, string) -> bool,
}

my_proc :: proc(i: My_Interface, name: string) -> bool {
	return i.required_name_length == len(name)
}

my_interface := My_Interface {
	required_name_length = 5,
	is_valid_name = my_proc,
}
```

27. It makes code more complicated. The author recommends using structs to store data and separate procedures to process data.

28.

```odin
Computer_Type :: enum {
	Laptop,    // value 0
	Desktop,   // value 1
	Mainframe, // value 2
}
```

29. They are named numbers.

30.

```odin
ct: Computer_Type
```

31.

```odin
ct = .Mainframe
```

32.

```odin
ct = Computer_Type.Mainframe
```

33.

```odin
switch ct {
case .Laptop:
	fmt.println("It's a laptop")

case .Desktop:
	fmt.println("It's a desktop")

case .Mainframe:
	fmt.println("Wow, a mainframe, in 2024?")
}
```

34.

```odin
if ct == .Laptop {
	fmt.println("It's a laptop")
} else if ct == .Desktop {
	fmt.println("It's a desktop")
} else if ct == .Mainframe {
	fmt.println("Wow, a mainframe, in 2024?")
}
```

35. It is less chatty and usually faster because the compiler can generate simpler code.

36.

```odin
#partial switch ct {
case .Laptop:
	fmt.println("It's a laptop")

case .Desktop:
	fmt.println("It's a desktop")
}
```

37. Avoiding `#partial` gives a compile error when new enum members are added, making it easier to update all switches.

38.

```odin
Computer_Type :: enum {
	Laptop = 1, // value 1
	Desktop,    // value 2
	Mainframe,  // value 3
}
```

39. A zero-initialized value may become invalid because `0` is not represented by any member.

40.

```odin
Computer_Type :: enum {
	Laptop = 1, 
	Desktop = 2, 
	Mainframe = 7, 
}
```

41.

```odin
Computer_Type :: enum {
	Laptop = 0,    // value 0 
	Desktop,       // value 1
	Mainframe = 5, // value 5
	Broken,        // value 6
	Gamer_Rig,     // value 7
}
```

42.

```odin
Animal_Type :: enum u8 {
	Cat,
	Rabbit,
}
```

43. When binding to libraries written in other languages where enum size must match what the library expects.

44.

```odin
if int(some_enum) == 5 { /* do stuff */ }
```

45.

```odin
My_Union :: union {
	f32,
	int,
	Person_Data,
}

Person_Data :: struct {
	health: int,
	age: int,
}

val: My_Union = int(12)
```

46. A union can store both what variant something is and the data associated with that variant.

47.

```odin
val = Person_Data {
	health = 76,
	age = 14,
}
```

48.

```odin
val = { health = 76, age = 14 }
```

49. Because skipping the type name would be ambiguous for a union.

50.

```odin
fmt.println(size_of(My_Union)) // 24
```

51.

```odin
switch v in val {
case int:
	// You can use v, it is of type int.

case f32:
	// You can use v, it is of type f32.

case Person_Data:
	// You can use v, it is of type
	// Person_Data. You can use v to access
	// the fields of Person_Data:
	fmt.println(v.age)
}
```

52. A union switch uses `switch v in val` and the cases are variant type names.

53.

```odin
switch &v in val {
case int:
	v = 7

case f32:
	v = 42

case Person_Data:
	v.age = 7
}
```

54.

```odin
f32_val, f32_val_ok := val.(f32)

if f32_val_ok {
	// f32_val is OK to use in here.
}
```

55.

```odin
if f32_val, f32_val_ok := val.(f32); f32_val_ok {
	// f32_val is OK to use in here.
}
```

56.

```odin
f32_val := val.(f32)
```

57.

```odin
if f32_val, ok := &val.(f32); ok {
	f32_val^ = 7
}
```

58.

```odin
Shape :: union {
	Shape_Circle,
	Shape_Square,
}

Shape_Circle :: struct {
	radius: f32,
}

Shape_Square :: struct {
	width: f32,
}

// Zero value: nil
shape: Shape
```

59. `nil`.

60.

```odin
Shape :: enum {
	Circle,
	Square,
}

// Zero value: Shape.Circle
shape: Shape
```

61. `Shape.Circle`.

62.

```odin
Shape :: union #no_nil {
	Shape_Circle,
	Shape_Square,
}

Shape_Circle :: struct {
	radius: f32,
}

Shape_Square :: struct {
	width: f32,
}

// Zero value:
// Variant Shape_Circle
shape: Shape
```

63. The union cannot be `nil`; its zero value becomes the first variant.

64. It tracks which variant the union currently holds.

65.

```text
0 -> nil
1 -> Shape_Circle
2 -> Shape_Square
```

66.

```text
0 -> Shape_Circle
1 -> Shape_Square
```

67.

```odin
Maybe :: union($T: typeid) {
	T,
}
```

68.

```odin
time: Maybe(int)
```

69.

```odin
time: Maybe(int)
fmt.println(time) // nil
time = 5
fmt.println(time) // 5
```

70.

```odin
if time_val, time_val_ok := time.?; time_val_ok {
	// Use time_val.
}
```

71.

```odin
t := time.?
```

72.

```odin
My_Raw_Union :: struct #raw_union {
	number: int,
	struct_val: My_Struct,
}

a_raw_union: My_Raw_Union
```

73. It makes all fields inside the struct start at the same point in memory, so they overlap.

74.

```odin
Entity :: struct {
	position: [2]f32,
	texture: Texture,
	can_jump: bool,
	time_in_space: f32,
}
```

75.

```odin
Entity :: struct {
	position: [2]f32,
	texture: Texture,
	variant: Entity_Variant,
}

Entity_Player :: struct {
	can_jump: bool,
}

Entity_Rocket :: struct {
	time_in_space: f32,
}

Entity_Variant :: union {
	Entity_Player,
	Entity_Rocket,
}
```

76.

```odin
player_entity := Entity {
	position = starting_position,
	texture = player_graphics,
	variant = Entity_Player {
		can_jump = true,
	}
}
```

---

# Chapter 6: Pointers

## Problems

1. **Concept:** What is a pointer?
2. **Code:** Write the full `increment_number` example that modifies an integer through a pointer.
3. **Code:** Fetch the address of `number` into `number_pointer`.
4. **Code:** Call `increment_number` without first storing the pointer in a separate variable.
5. **Concept:** What is the type of `number_pointer`?
6. **Code:** Print a pointer as an integer number.
7. **Code:** Write the shorter `increment_number` procedure shown later in the explanation.
8. **Code:** Expand `num^ += 1` into the equivalent assignment.
9. **Concept:** What does `^int` mean when the `^` is to the left of the type name?
10. **Concept:** What does `num^` mean when the `^` is to the right of a pointer variable?
11. **Code:** Declare a pointer to an integer without assigning a value.
12. **Concept:** What is the zero value of a pointer?
13. **Code:** Show the nil pointer crash example.
14. **Code:** Protect `increment_number` by checking `num != nil`.
15. **Code:** Protect `increment_number` with an early return if `num == nil`.
16. **Code:** Define the `Cat` struct.
17. **Code:** Define the `Cat_Color` enum.
18. **Code:** Write the full birthday example that increments a cat's age through a pointer.
19. **Concept:** Why does `process_cat_birthday(&my_cat)` modify `my_cat` directly?
20. **Code:** Show the repeated call to `process_cat_birthday(&my_cat)`.
21. **Code:** Show the field update inside `process_cat_birthday`.
22. **Code:** Show the explicit dereference version of the same field update.
23. **Concept:** Why can `cat.age` work even though `cat` is a pointer?
24. **Code:** Write `replace_cat`, which replaces the whole struct through a pointer.
25. **Concept:** Why is `cat^ = { ... }` needed instead of `cat = { ... }`?
26. **Code:** Copy a pointer, then write through the copy.
27. **Concept:** What do `pointer1` and `pointer2` contain after `pointer2 := pointer1`?
28. **Code:** Print the addresses of `pointer1` and `pointer2` themselves.
29. **Code:** Give the example hexadecimal output for those addresses.
30. **Code:** Print the address of `pointer1` as an integer.
31. **Code:** Show the read-through-pointer example.
32. **Code:** Show the write-through-pointer example.
33. **Code:** Create a pointer to the tenth element of an array.
34. **Code:** Show the misleading copy version that does not point to the original array element.
35. **Concept:** Why does `&array[10]` point to the original array element?
36. **Code:** Create a number and pointer to that number.
37. **Code:** Assign to `number` through `number_pointer`.
38. **Code:** Read from `number` through `number_pointer`.
39. **Concept:** What is an addressable?
40. **Code:** Show the invalid assignment to a constant number.
41. **Concept:** Why does that assignment not make sense?
42. **Code:** Repeat the pointer-to-array-element example.
43. **Code:** Take the address of a dereferenced pointer and get the original pointer back.

## Answer Key

1. A pointer is a reference that contains the memory address of something else.

2.

```odin
increment_number :: proc(num: ^int) {
	num^ += 1
}

number := 7
number_pointer := &number
increment_number(number_pointer)
fmt.println(number) // 8
```

3.

```odin
number_pointer := &number
```

4.

```odin
increment_number(&number)
```

5. `^int`, meaning pointer to integer.

6.

```odin
fmt.printfln("%i", some_pointer)
```

7.

```odin
increment_number :: proc(num: ^int) {
	num^ += 1
}
```

8.

```odin
num^ = num^ + 1
```

9. It denotes a pointer type, here “pointer to integer.”

10. It dereferences the pointer, reading or writing the value at the address stored in the pointer.

11.

```odin
my_pointer: ^int
```

12. `nil`, meaning no address.

13.

```odin
my_pointer: ^int
my_pointer^ = 10
```

14.

```odin
increment_number :: proc(num: ^int) {
	if num != nil {
		num^ += 1
	}
}
```

15.

```odin
increment_number :: proc(num: ^int) {
	if num == nil {
		return
	}

	num^ += 1
}
```

16.

```odin
Cat :: struct {
	name: string,
	age: int,
	color: Cat_Color,
}
```

17.

```odin
Cat_Color :: enum {
	Black,
	White,
	Orange,
	Tabby,
	Calico,
}
```

18.

```odin
process_cat_birthday :: proc(cat: ^Cat) {
	if cat == nil {
		return
	}

	cat.age += 1
}

my_cat := Cat {
	name = "Patches",
	age = 7,
	color = .Calico,
}

process_cat_birthday(&my_cat)

// Hooray, Patches is now 8 years old!
fmt.printfln("Hooray, %v is now %v years old!", my_cat.name, my_cat.age)
```

19. Because `&my_cat` passes the address of `my_cat`, so the procedure can modify the original struct through the pointer.

20.

```odin
process_cat_birthday(&my_cat)
```

21.

```odin
cat.age += 1
```

22.

```odin
cat^.age += 1
```

23. When accessing a field through a pointer to a struct, Odin makes the `^` implicit.

24.

```odin
replace_cat :: proc(cat: ^Cat) {
	if cat == nil {
		return
	}

	cat^ = {
		name = "Klucke",
		age = 6,
		color = .Tabby,
	}
}
```

25. `cat = { ... }` would try to change the pointer itself. `cat^ = { ... }` changes the struct value that the pointer points to.

26.

```odin
number := 7
pointer1 := &number
pointer2 := pointer1
pointer2^ = 10
```

27. They contain the same memory address, pointing to `number`.

28.

```odin
fmt.println(&pointer1)
fmt.println(&pointer2)
```

29.

```text
0x445C6FF868
0x445C6FF860
```

30.

```odin
fmt.printfln("%i", &pointer1)
```

31.

```odin
// Read a value through a pointer
read_value := some_pointer^
```

32.

```odin
// Write a value through a pointer
some_pointer^ = 10
```

33.

```odin
array: [20]int
element_pointer := &array[10]
```

34.

```odin
array: [20]int
element := array[10]
element_pointer := &element
```

35. Because `array[10]` is an addressable that still refers to the tenth element of the array.

36.

```odin
number: int
number_pointer := &number
```

37.

```odin
number_pointer^ = 10
```

38.

```odin
another_number := number_pointer^
```

39. An addressable is something the compiler can locate in memory, read from, and assign to.

40.

```odin
7 = some_variable
```

41. A constant like `7` is not addressable and cannot be assigned to.

42.

```odin
array: [20]int
element_pointer := &array[10]
```

43.

```odin
number := 7
number_pointer := &number
number_pointer_again := &number_pointer^
// Both these pointers refer to `number`!
```
