class TimeMap() {
    private val store = HashMap<String, MutableList<Pair<Int, String>>>()

    fun set(key: String, value: String, timestamp: Int) {
        store.getOrPut(key) { mutableListOf() }.add(Pair(timestamp, value))
    }

    fun get(key: String, timestamp: Int): String {
        val entries = store[key] ?: return ""
        for (i in entries.indices.reversed()) {
            if (entries[i].first <= timestamp) {
                return entries[i].second
            }
        }
        return ""
    }
}
