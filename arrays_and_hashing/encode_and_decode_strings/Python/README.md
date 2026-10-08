# Encode and Decode Strings — Python

Solutions ordered from most to least efficient. All three run in O(n) time
and produce O(n) output, so the ranking is by constant factors: how much
work each character costs and how much bigger the encoded string gets.

## 1. ⭐ Length Prefix — `1_length_prefix.py`

Write each string as its length, a `#`, then the string itself, e.g.
`5#hello3#abc`. The decoder never has to search for a separator inside the
text: it reads the number up to the first `#`, then skips forward exactly
that many characters, so a `#` (or anything else) inside the string is
harmless. Each character is copied once and the overhead is a few digits per
string.

- Time: O(n) over the total length of all strings
- Space: O(n) for the encoded string / decoded list

## 2. Escaping — `2_escape.py`

Pick `/` as an escape character. Every `/` in the text becomes `//`, and each
string is terminated by `/:`. The decoder scans character by character: a
`/` followed by `/` is a literal slash, and a `/` followed by `:` ends the
current string. This is the same idea as backslash-escaping in string
literals. It is still a single pass, but the decoder has to inspect every
character and the output grows a little whenever slashes appear.

- Time: O(n)
- Space: O(n)

## 3. Character Codes — `3_char_codes.py`

Replace every character with its numeric code, join the codes with commas,
and end each string with `;`. Digits, commas and semicolons never appear in
the encoded text except as part of the format, so splitting is trivial. The
catch is size: each character becomes two to four digits plus a comma, so
the encoded string is roughly three to four times longer than the input and
every character has to be converted to and from a number.

- Time: O(n)
- Space: O(n), but with a large constant (about 3-4x the input size)
