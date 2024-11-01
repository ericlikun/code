class Solution {
    func factorial(n: Int64) {
        var fact = 1
        for (i in 1..n + 1) {
            fact = fact * i
        }
        return fact
    }

    func getPermutation(n: Int64, k: Int64): String {
        let tokens = ArrayList<String>()
        for (i in 1..n + 1) {
            tokens.append(i.toString())
        }
        var res = ""
        var j = k
        j -= 1
        
        var m = n
        var a = 0
        while (m > 0) {
            m -= 1
            a = j / factorial(m)
            j = j % factorial(m)
            res += tokens.get(a).getOrThrow()
            tokens.remove(a)
        }
        
        return res
    }
}
