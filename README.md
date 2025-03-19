# Akash2Api

### 一个将 Akash Chat 转为兼容 OpenAI API 的 python 脚本。

#### 主要功能

- 自动获取cookies，无需手动添加
- 通过官方模型接口获取模型列表（支持绘画）
- 可配置API_KEY验证，默认为None

#### 当前支持模型

当前支持`Qwen QwQ-32B` `Llama 3.3 70B` `DeepSeek R1 671B` `Llama 3.1 405B` `AkashGen`

#### Docker部署

`docker run  -p 7860:7860 -e OPEN_API_KEY=Your-Api-Key --restart always --name akash2api xy2yp/akash2api:latest `

