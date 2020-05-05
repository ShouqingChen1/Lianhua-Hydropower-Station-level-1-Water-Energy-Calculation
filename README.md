# 莲花一级电站-水能设计分析

1.分析方法：水能设计的动态模拟法，即将电站的水文过程、机组特性和调度控制作为一个整体，根据实时工况的效率计算其实时发电量，以多年平均发电量最大为目标函数，求取最优的机组参数。

2.数据：
流量保证率

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%B5%81%E9%87%8F%E4%BF%9D%E8%AF%81%E7%8E%87.png)

水位流量关系

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%B0%B4%E4%BD%8D%E6%B5%81%E9%87%8F%E5%85%B3%E7%B3%BB.png)

3.可选机型:

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E6%96%B9%E6%A1%88%E8%AE%BE%E8%AE%A1.png)

4.数学模型：动态规划（对于给定的径流如何选择机组参数与流量分配，使实时发电量最大）

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E9%9D%9E%E7%BA%BF%E6%80%A7%E8%A7%84%E5%88%92%E6%96%B9%E7%A8%8B.png)

模型限制条件中：
第1式为机组出力公式；第2、3式为水轮机几何相似变换；第4式表示机组出力限制；第5式表示水头限制；第6、7式表示导叶和桨叶开度限制；第8式表示吸出高度限制；第9式表示机组引用流量不超过最大可用流量；第10式表示机组运行工况须在模型曲线范围内；水头损失取0.5m，发电机效率取95%。

5. 求解算法：动态规划及神经网络算法

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%E5%9F%BA%E6%9C%AC%E6%96%B9%E7%A8%8B.png)
![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C.png)

k为阶段变量，即第k台水轮机;Sk为k阶段状态变量，即k阶段剩余发电可引用流量;uk(Sk)为第k阶段处于状态Sk时的决策变量,即第k台水轮机的引用流量;vk表示第k阶段的阶段指标，即第k台水轮机的功率。
模型中涉及水轮机效率ηt，其由单位转速N11和单位流量Q11共同决定，是一个高度非线性的关系，建立神经网络对其进行学习仿真。

6. 计算结果

![image](https://github.com/ShouqingChen1/Dynamic-Simulation-Method-for-Hydropower-Station-Water-Energy-Calculation-and-Unit-Selection/blob/master/ImagesFolderforReadme/%E8%AE%A1%E7%AE%97%E7%BB%93%E6%9E%9C.png)

7. 结论
