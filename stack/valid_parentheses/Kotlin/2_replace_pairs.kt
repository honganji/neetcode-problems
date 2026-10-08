fun isValid(s: String): Boolean {
    var current = s
    while (true) {
        val reduced = current.replace("()", "").replace("[]", "").replace("{}", "")
        if (reduced == current) {
            return current.isEmpty()
        }
        current = reduced
    }
}
