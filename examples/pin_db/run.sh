#! /bin/bash

# 文件路径
input_path="."
output_path="output"
xslib_path="subxslib_pin.dat"

# 燃耗过程
powers=(1.8e7)
timesteps=(1)
timesteps_unit='MWd/kg'
diff_burnable_mats=1

# 燃耗区域
burn_materials=('moxpellet', 'h2o')
burn_materials_index='name'
burn_cells=()
burn_cells_index='name'

# 模拟参数
batch=10
inactive=5
particles=1000

# 指定NuitXsLibGenerator的路径
genlib_path="/home/dodo/RSAG/zhangweij/openmc/NuitXsLibGenerator"

# 设置OpenMC的环境变量
export OPENMC_CROSS_SECTIONS=/home/dodo/nuclear_data/openmc/endfb8/cross_sections.xml
export OPENMC_CHAIN_FILE=/home/dodo/nuclear_data/openmc/chain/chain_endfb71_pwr_0.12.xml

# 运行genlib.py
python $genlib_path/genlib.py --input_path $input_path --output_path $output_path --xslib_path $xslib_path \
    --powers ${powers[@]} --timesteps ${timesteps[@]} --timesteps_unit ${timesteps_unit} \
    --burn_materials ${burn_materials[@]} --burn_materials_index $burn_materials_index \
    --batch $batch --inactive $inactive --particles $particles \
    --burn_cells ${burn_cells[@]} --burn_cells_index $burn_cells_index --diff_burnable_mats $diff_burnable_mats