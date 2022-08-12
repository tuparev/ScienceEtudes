# ScienceEtudes

## Units and Measurements

OK, let us start with the elephants in the room. Apple implemented Units and Measurements as part of the Foundation framework. So why reimplement it?

Well, first of all, because Apple's implementation is naive (I am very diplomatic here) at best. Incompetent if I have to be honest. There are few thoughts that never crossed Apple's collective mind:
1. Most measurements are time-series - not single measurements.
2. To enhance `Unit`s and `Dimension`s one need to be a Swift developer. The Unix way is to make changes in a configuration file.
3. The only value type of Measurement is `Double`! This is insane, really!
4. The inheritance hierarchy `Unit`-> `Dimension` is, well, insane too!
5. Measurement? What do we measure (mean value, current value)? When we measure (timestamp)?
6. Sensors? What? You measure with sensors?
7. Lack of measurement environment
8. We need performance when we work on large amount of measurement data
9. Measurement could be anything - am image, a single number, a table (time-series), not just a `Double`!
10. No support for [QUDT](https://www.qudt.org/)
11. No support for vectors
99. ... and many others

