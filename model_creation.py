#%%
# Loading in pre-trained model: Code Parrot (https://huggingface.co/codeparrot/codeparrot)

from transformers import AutoTokenizer, TFAutoModelForCausalLM
  
tokenizer = AutoTokenizer.from_pretrained("codeparrot/codeparrot")
model = TFAutoModelForCausalLM.from_pretrained("codeparrot/codeparrot", from_pt=True) # Converting to TensorFlow (Code Parrot uses PyTorch by default)
# %%
