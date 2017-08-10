module Solve where

-- Define predicates and/2, or/2, nand/2, nor/2, xor/2, impl/2 and equ/2
-- Continue problem P46 by defining and/2, or/2, etc as being operators.
(^&%) :: Bool -> Bool -> Bool
True ^&% True = True
_ ^&% _ = False

($#@) :: Bool -> Bool -> Bool
True $#@ _ = True
_ $#@ True = True
_ $#@ _ = False

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
