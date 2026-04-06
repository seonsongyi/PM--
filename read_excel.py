import pandas as pd

df = pd.read_excel("전체본부 PM역량인증시험 신청자명단_0406.xlsx")
print("컬럼 목록:", df.columns.tolist())
print("행 수:", len(df))
print("\n첫 5행:")
print(df.head())
print("\n데이터 타입:")
print(df.dtypes)
