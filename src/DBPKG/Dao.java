package hrd01.DBPKG;

import hrd01.DTO.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class Dao
{
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    
    public List<MoneyDTO> getMoneyList() {
        final List<MoneyDTO> list = new ArrayList<MoneyDTO>();
        try {
            this.conn = ConnectionDB.getConnection();
            final String sql = "SELECT a.custno, a.custname, "
            		+ "CASE\r\n"
            		+ "    WHEN a.grade = 'A' THEN 'VIP' "
            		+ "    WHEN a.grade = 'B' THEN '일반' "
            		+ "    WHEN a.grade = 'C' THEN '중급' "
            		+ "END AS grade, "
            		+ "SUM(b.price) AS sale "
            		+ "FROM member_tbl_02 a JOIN money_tbl_02 b ON a.CUSTNO = b.custno "
            		+ "GROUP BY a.custno, a.custname, grade "
            		+ "ORDER BY sale DESC;";
            this.pstmt = this.conn.prepareStatement(sql);
            this.rs = this.pstmt.executeQuery();
            while (this.rs.next()) {
                final MoneyDTO dto = new MoneyDTO();
                dto.setCustno(this.rs.getInt(1));
                dto.setCustname(this.rs.getString(2));
                dto.setGrade(this.rs.getString(3));
                dto.setSale(this.rs.getInt(4));
                list.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("getMoneyList");
            e.printStackTrace();
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
            return list;
        }
        finally {
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        try {
            ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
        }
        catch (Exception e2) {
            e2.printStackTrace();
        }
        return list;
    }
    
    public int getCustnoInsert() {
        try {
            this.conn = ConnectionDB.getConnection();
            final String sql = "select max(custno) from member_tbl_02";
            this.pstmt = this.conn.prepareStatement(sql);
            this.rs = this.pstmt.executeQuery();
            if (this.rs.next()) {
                return this.rs.getInt(1) + 1;
            }
        }
        catch (Exception e) {
            System.out.println("getDateInsert");
            e.printStackTrace();
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
            return 0;
        }
        finally {
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        try {
            ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
        }
        catch (Exception e2) {
            e2.printStackTrace();
        }
        return 0;
    }
    
    public List<MemberDTO> getSearchMemberList() {
        final List<MemberDTO> list = new ArrayList<MemberDTO>();
        try {
            this.conn = ConnectionDB.getConnection();
            final String sql = "SELECT custno, custname,phone,address,joindate,case grade when 'A' then 'VIP' when 'B' then '\uc77c\ubc18' when 'C' then '\uc9c1\uc6d0' end grade,city FROM member_tbl_02";
            this.pstmt = this.conn.prepareStatement(sql);
            this.rs = this.pstmt.executeQuery();
            while (this.rs.next()) {
                final MemberDTO dto = new MemberDTO();
                dto.setCustno(this.rs.getInt(1));
                dto.setCustname(this.rs.getString(2));
                dto.setPhone(this.rs.getString(3));
                dto.setAddress(this.rs.getString(4));
                dto.setJoindate(this.rs.getString(5).substring(0, 10));
                dto.setGradeStr(this.rs.getString(6));
                dto.setCity(this.rs.getString(7));
                list.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("getCustnoInsert");
            e.printStackTrace();
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
            return list;
        }
        finally {
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return list;
    }
    
    public int setMemberInsert(final MemberDTO dto) {
        try {
            this.conn = ConnectionDB.getConnection();
            final String sql = "INSERT INTO member_tbl_02 VALUES(?,?,?,?,STR_TO_DATE(?,'%Y-%m-%d'),?,?)";
            (this.pstmt = this.conn.prepareStatement(sql)).setInt(1, dto.getCustno());
            this.pstmt.setString(2, dto.getCustname());
            this.pstmt.setString(3, dto.getPhone());
            this.pstmt.setString(4, dto.getAddress());
            this.pstmt.setString(5, dto.getJoindate());
            this.pstmt.setString(6, dto.getGrade());
            this.pstmt.setString(7, dto.getCity());
            return this.pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("getMemberInsert");
            e.printStackTrace();
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        finally {
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return -1;
    }
    
    public int setMemberUpdate(final MemberDTO dto) {
        try {
            this.conn = ConnectionDB.getConnection();
            final String sql = "UPDATE member_tbl_02 SET custname=?,phone=?,address=?,joindate=STR_TO_DATE(?,'%Y-%m-%d'),grade=?,city=? WHERE custno=?";
            (this.pstmt = this.conn.prepareStatement(sql)).setString(1, dto.getCustname());
            this.pstmt.setString(2, dto.getPhone());
            this.pstmt.setString(3, dto.getAddress());
            this.pstmt.setString(4, dto.getJoindate());
            this.pstmt.setString(5, dto.getGrade());
            this.pstmt.setString(6, dto.getCity());
            this.pstmt.setInt(7, dto.getCustno());
            return this.pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("setMemberUpdate");
            e.printStackTrace();
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        finally {
            try {
                ConnectionDB.closeAll(this.conn, this.pstmt, this.rs);
            }
            catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return -1;
    }
}