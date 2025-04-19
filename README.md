# semm-ocl

## TODO

- at least 10 meaningful invariants, **10 pre-** and **10 post-**conditions must be defined;
- at least 3 post-conditions must include the values of features at the start of the operation (**@pre**);
- at least 5 invariants and 5 post-conditions must include the **collection** operations;
- at least 5 different collection operations must be used, including **collect** and **select** operations;
- at least 1 **collection of collections** must be used;
- at least 2 invariants must include the **collection types**;
- at least 3 **local variables** must be defined and used;
- at least 3 **queries** must be defined, at least 2 of which must use **collection** operations;
- at least 2 **tuples** must be used.

## Keywords

| Keyword                    | Description                    |
| -------------------------- | ------------------------------ |
| inv, pre, post             | Introduces constraints         |
| if-then-else-endif         | Conditional expression         |
| not, or, and, xor, implies | Boolean expression             |
| package, endpackage        | Boolean expression             |
| context                    | Introduces constraints         |
| def                        | Global definition              |
| let, in                    | Local definition               |
| derive                     | Attribute derivation           |
| init                       | Initial value description      |
| result                     | Result value from an operation |
| self                       | Object being constrained       |

## Definitions

**Assertion** - predicate, a true or false statement
**Constraint** - formal assertion of system properties

**Invariant** - constraint of that should be true for an object through out his complete life cycle

```ocl
context <class name>
inv [<invariant name>]: <OCL logical expression>

context Project
inv dateInterval: self.end > self.start
```

**Precondition** - constraint that must be true just prior to the execution of an operation

```ocl
context <class name> :: <operation> (<parameters>) : <result type>
  pre[<precondition name>]: <OCL logical expression>

context Project :: prolong(d:Integer)
  pre importance: self.importance<>Importance::extreme
pre daysPositive: d>0
```

**Postcondition** - constraint that must be true just after to the execution of an operation. This is the way actual effect of an operation is described in OCL

```ocl
context Project :: duration(): Integer
  post: result = Date::days(self.end) - Date::days(self.start)

context Project::prolong(d:integer)
  post: self.end = self.end@pre + d and
        self.prolongation = self.prolongation + d
```

Combination of **pre** and **post**:

```ocl
context Project :: prolong(d: Integer)
  pre: importance<>Importance::extreme and
       d > 0
  post: end = end@pre + d and
        prolongation = prolongation + d

context Project::shift(d: Integer)
pre: (d > 0 and start > Date::now) or
     (d < 0 and start + d > Date::now)
post: start = start@pre + d and
      end = end@pre + d
```

**Packages** - we can group our invariants into packages

```ocl
package Package::SubPackage

context X
  inv: ...
    ...
context X::operation (..)
  pre: ...

endpackage
```

**Data types:**

Basic types:

- Boolean
- Integer
- Real
- String

Collection:

- Collection(T)
- Set(T)
- OrderedSet(T)
- Bag(T)
- Sequence(T)

These collections are used to define constraints for associations

**Enumeration** - a set of literals

```ocl
context Project :: prolong(d: Integer)
  pre: importance <> Importance::extreme
```

**Variables** - We can reuse expressions as variables by using either **let** (for local variables) or **def** (for variables across different expressions)

```ocl
context Project :: shift(d: Integer)
  pre: let today : Date = Date::now
      in (d > 0 and start > today) or
          (d < 0 and start + d > today)
```

**Queries** - operations that don't change the system status and returns a value or set of values. These definitions are stricter than post conditions

```ocl
context Project :: duration() : Integer
  body: Date::days(self.end) Date::days(self.start)
```

Use does not support queries, but we can define them in class definitions.

```ocl

class Project
attributes
  title: String
  startDate : Date
  endDate : Date
operations
  duration() : Integer = endDate - startDate

```

**Associations** - the lines that connect one object to another. (AI example).

**Tuples** - named parts with distinct types. Record types or struct

```ocl
Tuple{name: String = Jonas , age: Integer = 23}

context Project :: employeesData() : Set(TupleType(
  employee: Person,
  leadingProjects: Set(Project),
  extraProjects: Set(Project),
  nofProjects: Integer,
  nofDays: Integer))
post: result = employees->collect(e : Person |
  Tuple{
    employee = e,
    leadingProjects = e.managedProjects -> asSet(),
    extraProjects = e.projects -> select(p: Project |
      p.importance = Importance::extreme) -> asSet(),
    nofDays = e.participation.nofDays -> sum(),
    nofProjects = e.projects -> size()
    }) -> asSet()
```
