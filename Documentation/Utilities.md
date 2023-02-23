# Utilities

## copy

Copy a value from one store to another one.

## move

Move a value from one store to another one. Will copy the value and only remove the original if the copy succeeds.

## replacing

Use this for migrating from one ValueStore to another one. It tries to load from the new one, and if the value isn’t there, it moves it from the old one.

## cached(by:)

You can cache one ValueStore with another one that you know is faster. This gives you a ValueStore that will try to load first from the fast store, and if it doesn’t find the value there it will load from the slow one.

## set

Simple utility to save or remove a value using an optional. If the value is nil the stored value will be removed, and if there’s some value it will be stored.

## coded

Accepts a Codec so that we can transform the Value we store into a NewValue.

## load(default:)

Allows to load without error by defaulting to the passed value. There are two variants, depending on the type of the Environment:

```swift
await store.load(default: defaultValue, environment: myEnvironment)
```

```swift
await store.load(default: defaultValue)
```
