package com.test;

public class MemberDTO
{
	private String name;
	private String tel;
	private String adress;
	
	// 생성자
	public MemberDTO()
	{
		
	}
	
	// ??
	public MemberDTO(String name, String tel, String adress)
	{
		this.name = name;
		this.tel = tel;
		this.adress = adress;
	}
	
	// getter setter 구성
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAdress()
	{
		return adress;
	}

	public void setAdress(String adress)
	{
		this.adress = adress;
	}
	
	
}
