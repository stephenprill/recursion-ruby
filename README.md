# Intro to Recursion

## Background

Recursion is a technique where a method can call itself.  Recursion can be used to traverse tree structures.

For example, take the following tree, where each letter represents a node in the tree:

```
          A
      ____|____
      |       |
      B       C
    __|__   __|__
    |   |   |   |
    D   E   F   G
                |
                H

```

In this tree, we can say that

* `A` is the "root" node
* `A` has two child nodes: `[B, C]`
* `B` has two child nodes: `[D, E]`
* `C` has two child nodes: `[F, G]`
* `G` has one child node:  `[H]`

Let's say you wanted to go over the entire tree and print the letters out, you could write code like this:

```ruby
puts root.letter                                      # prints "A"
root.child_nodes.each do |child_node_1|               # goes over ["B", "C"]
  puts child_node_1.name
  child_node_1.child_nodes.each do |child_node_2|     # goes over ["D", "E"], then ["F", "G"]
    puts child_node_2.name
    child_node_2.child_nodes.each do |child_node_3|   # goes over ["H"]
      puts child_node_3.name
    end
  end
end
```

You can see that this only works if the tree has 4 levels.  But what if it had 8, or 100 levels?  Basically that code
is doing the same thing, but from a different starting point:

1. Start with `A`, print `A`'s letter
1. Go over all of `A`'s children and repeat step 1, but start with `B`, then with `C`

We could write that in Ruby like so:

```ruby
def print_letters(node)
  puts node.name
  node.child_nodes.each do |child_node|
    print_letters(child_node)
  end
end
```

## Challenge #1

Write a method that will `puts` out the names of each file in this directory recursively, indenting two spaces at each level.

To get all the files in this directory, use:

```ruby
Dir.glob("*") do |path|
  # ...
end
```

To determine if a file is a directory, use:

```ruby
File.directory?("some/path")
```

To get all the files in the folder `Desktop`, use:

```ruby
Dir.glob("/Users/somename/Desktop/*") do |path|
  # ...
end
```

To get just the filename (not the full path), use:

```ruby
File.basename("/some/long/path.txt")
```

Read more here:

* http://ruby-doc.org//core-2.2.0/File.html#method-c-size
* http://ruby-doc.org/core-2.2.0/Dir.html#method-c-glob

## Challenge #2

Write a method that returns the total size of all the files in this directory.

To get the size of an individual file, use:

```ruby
File.size('README.md')
```

## Challenge #3

Make `node_walker_spec.rb` pass.
