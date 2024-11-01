/*

给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。


示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2

示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5

 

提示：

    nums1.length == m
    nums2.length == n
    0 <= m <= 1000
    0 <= n <= 1000
    1 <= m + n <= 2000
    -10**6 <= nums1[i], nums2[i] <= 10**6

*/

class Solution {
    func findMedianSortedArrays(nums1: Array<Int64>, nums2: Array<Int64>): Float64 {
        var numbers = ArrayList<Int64>(nums1)
        for (i in 0..nums2.size()) {
            numbers.append(nums2[i])
        }
        numbers.sort()
        var l = numbers.size()
        if (l % 2 != 0) {
            return Float64(numbers[Int64(l / 2)])
        }
        var m1 = numbers[Int64(l / 2) - 1]
        var m2 = numbers[Int64(l / 2)] 
        return (Float64(m1) + Float64(m2)) / Float64(2)
    }
}