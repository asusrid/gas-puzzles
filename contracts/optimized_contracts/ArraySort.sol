// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySort {
    function sortArray(
        uint256[] memory data
    ) external pure returns (uint256[] memory) {
        quickSort(data, 0, data.length - 1);
        return data;
    }

    function quickSort(uint[] memory arr, uint left, uint right) private pure {
        uint i = left;
        uint j = right;
        if (i == j) return;
        uint pivot = arr[left + (right - left) / 2];
        while (i < j) {
            while (arr[i] < pivot) i++;
            while (pivot < arr[j]) j--;
            if (i <= j) {
                (arr[i], arr[j]) = (arr[j], arr[i]);
                i++;
                if (j > 0) {
                    j--;
                } else {
                    break;
                }
            }
        }
        if (left < j) quickSort(arr, left, j);
        if (i < right) quickSort(arr, i, right);
    }
}
