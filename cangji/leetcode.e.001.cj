/*
给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

你可以按任意顺序返回答案。

 

示例 1：

输入：nums = [2,7,11,15], target = 9
输出：[0,1]
解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

示例 2：

输入：nums = [3,2,4], target = 6
输出：[1,2]

示例 3：

输入：nums = [3,3], target = 6
输出：[0,1]

 

提示：

    2 <= nums.length <= 104
    -109 <= nums[i] <= 109
    -109 <= target <= 109
    只会存在一个有效答案

进阶：你可以想出一个时间复杂度小于 O(n2) 的算法吗？

*/

class Solution {
    func twoSum(nums: Array<Int64>, target: Int64): Array<Int64> {
        let res = ArrayList<Int64>()
        for (i in 0..nums.size()) {
            let nums_copy = ArrayList<Int64>(nums.clone())
            for (j in 0..nums_copy.size()) {
                if (nums_copy[j] == nums[i]) {
                    nums_copy.remove(j)
                    break
                }
            }
            if (nums_copy.contains(target - nums[i])) {
                res.append(i)
            }
        }
        return [res[0], res[1]]
    }
}