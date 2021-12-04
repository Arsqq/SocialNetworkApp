package com.example.socialnetworkv2.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name="usr")

public class User implements UserDetails,Serializable {
    private static final long serialVersionUID = -8377820243186312358L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message=" Username can't be empty")
    private String username;
    @NotBlank(message=" Password can't be empty")
    private String password;
    private boolean active;
    @Email(message="Email is not correct")
    @NotBlank(message="Email can't be empty")
    private String email;
    private String activationCode;
    private String name;
    private String surname;
    private String phone;
    private Integer age;

    @ElementCollection(targetClass = Role.class,fetch =FetchType.EAGER)
    @CollectionTable(name="user_role",joinColumns = @JoinColumn(name="user_id"))
    @Enumerated(EnumType.STRING)
    private Set <Role> roles;


    @OneToMany(mappedBy = "author",cascade = CascadeType.ALL,fetch =FetchType.LAZY)
    private Set<Message> messages;

    @ManyToMany
    @JoinTable(
            name="user_subscriptions",
            joinColumns = {@JoinColumn(name="channel_id")},
            inverseJoinColumns = {@JoinColumn(name="subscriber_id")}
    )
    private Set<User> subscribers=new HashSet<>();

    @ManyToMany
    @JoinTable(
            name="user_subscriptions",
            joinColumns = {@JoinColumn(name="subscriber_id")},
            inverseJoinColumns = {@JoinColumn(name="channel_id")}
    )
    private Set<User> subscriptions=new HashSet<>();
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id.equals(user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    private boolean isAdmin(){
         return roles.contains(Role.ADMIN);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
