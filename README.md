# 莲花一级电站-水能设计分析

1.分析方法：水能设计的动态模拟法，其将电站的水文过程、机组特性和调度控制作为一个整体，根据实时工况的效率计算其实时发电量，以多年平均发电量最大为目标函数，求取最优的机组参数。

2.数据：
径流

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%B5%81%E9%87%8F%E4%BF%9D%E8%AF%81%E7%8E%87.png)

水位

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%B0%B4%E4%BD%8D%E6%B5%81%E9%87%8F%E5%85%B3%E7%B3%BB.png)

3.可选机型:

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%96%B9%E6%A1%88%E8%AE%BE%E8%AE%A1.png)
4.数学模型：非线性规划(给定的径流和给定的机组参数，如何分配各台机组的流量（出力），以使水能充分利用) 

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E9%9D%9E%E7%BA%BF%E6%80%A7%E8%A7%84%E5%88%92%E6%96%B9%E7%A8%8B.png)

5. 求解算法：神经网络及动态规划算法

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%E5%9F%BA%E6%9C%AC%E6%96%B9%E7%A8%8B.png)
![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C.png)

6. 计算结果

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E8%AE%A1%E7%AE%97%E7%BB%93%E6%9E%9C.png)

7. 结论
