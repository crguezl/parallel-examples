Parallel gem: a few examples of use
============

My machine has two cores:

          [~/ruby/parallel/parallel-examples(master)]$ sysctl -n machdep.cpu.brand_string
          Intel(R) Core(TM) i5-2557M CPU @ 1.70GHz

          [~/ruby/parallel/parallel-examples(master)]$ sysctl -a | grep machdep.cpu.*.core
          machdep.cpu.cores_per_package: 8
          machdep.cpu.thermal.core_power_limits: 1
          machdep.cpu.core_count: 2

when running with `jruby`

          [~/ruby/parallel/parallel-examples(master)]$ ruby -v
          jruby 1.7.3 (1.9.3p385) 2013-04-17 fffffff on Java HotSpot(TM) 64-Bit Server VM 1.7.0_25-b15 [darwin-x86_64]

I've got for two threads:

          [~/ruby/parallel/parallel-examples(master)]$ ruby one.rb 2
          size = 4194304
          num threads = 2
          before partition = 1386677540.615 after partition = 1386677542.0, diff = 1.385
          before sum = 1386677542.003 after sum = 1386677550.466, diff = 8.463
          before reduction = 1386677550.466 after reduction = 1386677550.469, diff = 0.003
          3718399.8749137484
          2
          Float
          [1859119.4406181404, 1859280.4342956077]

and for one thread:

          [~/ruby/parallel/parallel-examples(master)]$ ruby one.rb 1
          size = 4194304
          num threads = 1
          before partition = 1386677559.473 after partition = 1386677560.939, diff = 1.466
          before sum = 1386677560.942 after sum = 1386677572.286, diff = 11.344
          before reduction = 1386677572.287 after reduction = 1386677572.289, diff = 0.002
          3718310.0775373876
          1
          Float
          [3718310.0775373876]

See also:
--------

1. [Code Safari: Forks, pipes, and the Parallel gem](http://www.sitepoint.com/code-safari-forks-pipes-and-the-parallel-gem/) en SitePoint por Xavier Shay.  Published June 16, 2011

1. La gema [parallel](https://github.com/grosser/parallel) en GitHub

1. [Easy Ruby Paralellism With the 'Parallel' Gem](http://blog.mostof.it/easy-ruby-paralellism-with-the-parallel-gem/) Sep 27th, 2011

1. [peach: parallel each](https://github.com/schleyfox/peach) en GitHub

1. [Basic Benchmarking in Ruby](http://blogs.burnsidedigital.com/2012/10/basic-benchmarking-in-ruby/) por Joshua Ballanco

1. [Measure Twice, Code Once](http://blogs.burnsidedigital.com/2012/11/measure-twice-code-once/) por Joshua Ballanco

1. [Benchmarking parallel gem](https://gist.github.com/francescoagati/4242223)
