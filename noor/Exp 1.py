import numpy as np

code1 = np.array([ 1,  1,  1,  1])
code2 = np.array([ 1, -1,  1, -1])
code3 = np.array([ 1,  1, -1, -1])
code4 = np.array([ 1, -1, -1,  1])

allCodes = {
    1: code1,
    2: code2,
    3: code3,
    4: code4
}

inputStr = input ("Enter: ")
inputArr = np.array (inputStr.split(" "), dtype=int)

combinedSignal = np.dot (inputArr, np.array (list(allCodes.values())))
print ("\n\nActual Channel Tx: ")
print (combinedSignal)

# -------------------------------------------------
# Recover only one selected channel
# -------------------------------------------------

# selectedChannel = int(input("\nEnter channel to decode (1-4): "))

# recoveredBit = (
#     np.dot(combinedSignal, allCodes[selectedChannel])
#     // len(allCodes[selectedChannel])
# )

# print(f"\nRecovered bit from Channel {selectedChannel}: {recoveredBit}")


print("\nRecovered bits:")
 
for i in range(1, 5):
    recoveredBit = np.dot(combinedSignal, allCodes[i]) // len(allCodes[i])
    print(f"Channel {i}: {int(recoveredBit)}")
