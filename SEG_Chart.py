import matplotlib.pyplot as plt
import numpy as np

# Data from 30-cycle test results
labels = ['Scenario A (Concatenation)', 'Scenario B (Bind Variables)']
averages = [0.00042, 0.00058]

x = np.arange(len(labels))
width = 0.5

fig, ax = plt.subplots(figsize=(8, 5))
bars = ax.bar(x, averages, width, color=['#e74c3c', '#2ecc71'])

ax.set_ylabel('Execution Time (Seconds)')
ax.set_title('Performance Comparison: Vulnerable vs. Secure (30 Cycles)')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.set_ylim(0, 0.0008)

for bar in bars:
    height = bar.get_height()
    ax.annotate(f'{height:.5f}s', 
                xy=(bar.get_x() + bar.get_width() / 2, height),
                xytext=(0, 3), 
                textcoords="offset points", 
                ha='center', va='bottom', fontweight='bold')

plt.tight_layout()

plt.savefig('performance_chart_30cycles.png')

plt.show()