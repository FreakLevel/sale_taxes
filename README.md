# Sales with Taxes Challenge

## Challenge

To see the description of the challenge, please visit this [page](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36)

## Requirements

- Ruby 3.1.2
- Bundler (preferably 2.3.15 as the Gemfile.lock file)

## How to run

There are two ways to run the program:

### Using IRB

You can open an IRB instance, load the `main` file, and start an instance of the class with the file path of the sale you want to try. After that, you only need to call the method `run` and going to print the sale information.
```console
foo@bar:sale_taxes$ irb
irb(main):001:0>require './lib/main'
irb(main):002:0>main = Main.new(path_of_file)
irb(main):003:0># If at this point doesn't show an exception, then the class detected a file in the path you send in the initializer
irb(main):003:0>main.run
```
After running the main method, you can see the output of the sale information (if the file has the correct information).

### Running with `run` file

There is a file name `run.rb` in the root of the folder; you can call this file with the argument `-f` or `--file-path=` and add the file path with the list of products to buy.

```console
foo@bar:sale_taxes$ ruby run.rb -f path_of_file
```

## Outros

### Time of completion

This challenge was resolved in 3:40 hours approx.

### Examples

You can find the same, as the readme of the problem, examples inside the folder of `examples` in the root.
You can try running it with:  `ruby run.rb -f examples/inputX.txt`

### Considerations

This code assumes that the product has the name correctly added to the `products_by_categories.json` file, where is inside of one category (existing or new), snake cased, with lowercase and singularized.

If it is a set of a product like the box of chocolates, you can add it to the list as `boxes of chocolates`, but in the json file need to be added as a single one `box of chocolates` where the product is a box but the product is a set of so keep the pluralization of the chocolate.

This time doesn't contemplate bad files, so the program will crash if you change the conditions to read each line.

You can add or remove a category to be free tax in the `product` model.
