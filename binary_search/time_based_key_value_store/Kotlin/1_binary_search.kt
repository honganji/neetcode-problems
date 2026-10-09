class TimeMap() {
    private val store = HashMap<String, MutableList<Pair<Int, String>>>()

    fun set(key: String, value: String, timestamp: Int) {
        store.getOrPut(key) { mutableListOf() }.add(Pair(timestamp, value))
    }

    fun get(key: String, timestamp: Int): String {
        val entries = store[key] ?: return ""
        var left = 0
        var right = entries.size - 1
        var result = ""
        while (left <= right) {
            val mid = (left + right) / 2
            if (entries[mid].first <= timestamp) {
                result = entries[mid].second
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}
