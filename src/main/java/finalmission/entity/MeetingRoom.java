package finalmission.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class MeetingRoom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "meeting_room_id")
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String reason;

    @Column(nullable = false)
    private Integer availablePeopleCount;

    protected MeetingRoom() {
    }

    public MeetingRoom(final Long id, final String name, final String reason, final Integer availablePeopleCount) {
        this.id = id;
        this.name = name;
        this.reason = reason;
        this.availablePeopleCount = availablePeopleCount;
    }

    public MeetingRoom(final String name, final String reason, final Integer availablePeopleCount) {
        this(null, name, reason, availablePeopleCount);
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getReason() {
        return reason;
    }

    public Integer getAvailablePeopleCount() {
        return availablePeopleCount;
    }
}
