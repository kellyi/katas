def maybeValue(n: Int): Option[Int] = n match {
  case v if v % 5 == 0 => Some(v)
  case v if v % 3 == 0 => Some(v)
  case _ => None
}

println((1 to 999).flatMap { case e => maybeValue(e) }.sum)

