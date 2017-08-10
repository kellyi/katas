module Solve where

-- Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2
and :: Bool -> Bool -> Bool
and True True = True
and _ _ = False

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or _ _ = False

nand :: Bool -> Bool -> Bool
nand False False = True
nand _ _ = False

nor :: Bool -> Bool -> Bool
nor True _ = False
nor _ True = False
nor _ _ = True

xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _ = False

impl :: Bool -> Bool -> Bool
impl True _ = False
impl False y = y

equ :: Bool -> Bool -> Bool
equ True True = True
equ False False = True
equ _ _ = False
